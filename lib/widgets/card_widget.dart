import 'package:flutter/material.dart';

Container cardWidget(
  BuildContext context,
  Widget widget,
  double? height,{
      RoundedRectangleBorder? cardShape,
      EdgeInsets? cardPadding,
}
) {
  cardShape ??= RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  cardPadding ??= EdgeInsets.all(5);

  return Container(
    height: height,
    padding: cardPadding,
    child: Card(
      shape: cardShape,
      child: widget,
    ),
  );
}
