import 'package:flutter/material.dart';
import 'package:junto_beta_mobile/models/expression.dart';

class PhotoOpen extends StatelessWidget {
  const PhotoOpen(this.photoExpression);

  final CentralizedExpressionResponse photoExpression;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          photoExpression.expressionData.image == 'test-image'
              ? const SizedBox()
              : Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: 'photo_preview-' + photoExpression.address,
                    child: Image.network(photoExpression.expressionData.image,
                        height: 200, width: 200),
                  ),
                ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              photoExpression.expressionData.caption,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
