import 'package:flutter/material.dart';
import 'package:junto_beta_mobile/custom_icons.dart';
import 'package:junto_beta_mobile/models/expression.dart';
import 'package:junto_beta_mobile/palette.dart';

class ExpressionOpenBottom extends StatefulWidget {
  const ExpressionOpenBottom(this.expression);

  final Expression expression;

  @override
  State<StatefulWidget> createState() => ExpressionOpenBottomState();
}

class ExpressionOpenBottomState extends State<ExpressionOpenBottom> {
  String timestamp;

  @override
  void initState() {
    super.initState();
    timestamp = widget.expression.timestamp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7.5),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: JuntoPalette.juntoFade, width: .5),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  timestamp + ' MINUTES AGO',
                  style: const TextStyle(
                      fontSize: 10, color: JuntoPalette.juntoSleek),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(CustomIcons.half_lotus, size: 14))
              ]),
        ],
      ),
    );
  }
}
