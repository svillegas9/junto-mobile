import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:junto_beta_mobile/app/app_config.dart';
import 'package:junto_beta_mobile/models/models.dart';
import 'package:junto_beta_mobile/backend/backend.dart';
import 'package:junto_beta_mobile/backend/repositories/app_repo.dart';
import 'package:junto_beta_mobile/widgets/end_drawer/end_drawer_relationships/error_widget.dart';
import 'package:junto_beta_mobile/widgets/progress_indicator.dart';
import 'package:junto_beta_mobile/widgets/custom_feeds/filter_column_row.dart';
import 'package:provider/provider.dart';
import 'package:junto_beta_mobile/widgets/custom_feeds/custom_listview.dart';
import 'package:junto_beta_mobile/widgets/custom_feeds/single_listview.dart';
import 'package:junto_beta_mobile/widgets/custom_feeds/feed_placeholder.dart';

class JuntoCommunityCenterFeedback extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JuntoCommunityCenterFeedbackState();
  }
}

class JuntoCommunityCenterFeedbackState
    extends State<JuntoCommunityCenterFeedback> {
  // final String communityCenterAddress = appConfig.flavor == Flavor.prod
  //     ? '0ab99620-8835-d63b-3836-f091992ca2b4'
  //     : '48b97134-1a4d-deb0-b27c-9bcdfc33f386';

  final String communityCenterAddress = '0ab99620-8835-d63b-3836-f091992ca2b4';

  Future<QueryResults<ExpressionResponse>> getExpressions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setGetExpressions();
  }

  void setGetExpressions() {
    setState(() {
      getExpressions = Provider.of<ExpressionRepo>(context, listen: false)
          .getCollectiveExpressions({
        'context': communityCenterAddress,
        'context_type': 'Group',
        'pagination_position': '0',
      });
    });
  }

  void deleteExpression(ExpressionResponse expression) async {
    await Provider.of<ExpressionRepo>(context, listen: false)
        .deleteExpression(expression.address);
    // refresh feed
    setGetExpressions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppRepo>(builder: (context, AppRepo appRepo, _) {
      return FutureBuilder<QueryResults<ExpressionResponse>>(
        future: getExpressions,
        builder: (BuildContext context,
            AsyncSnapshot<QueryResults<ExpressionResponse>> snapshot) {
          if (snapshot.hasData && snapshot.data.results.length == 0) {
            return FeedPlaceholder(
              placeholderText: 'No expressions yet!',
            );
          } else if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                if (snapshot.data.results.length > 0)
                  FilterColumnRow(
                    twoColumnView: appRepo.twoColumnLayout,
                  ),
                appRepo.twoColumnLayout
                    ? Expanded(
                        child: TwoColumnList(
                          data: snapshot.data.results,
                          deleteExpression: deleteExpression,
                        ),
                      )
                    : Expanded(
                        child: SingleColumnListView(
                          data: snapshot.data.results,
                          privacyLayer: 'Public',
                          deleteExpression: deleteExpression,
                        ),
                      ),
              ],
            );
          } else if (snapshot.hasError) {
            return JuntoErrorWidget(
              errorMessage: 'Hmm, something went wrong',
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0.0, -50),
              child: JuntoProgressIndicator(),
            ),
          );
        },
      );
    });
  }
}
