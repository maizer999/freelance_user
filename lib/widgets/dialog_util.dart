import 'package:flutter/material.dart';

double kTableWidthPercentage = 0.6;
const int kTabletBreakpoint = 600;

bool isTablet(BuildContext context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;

  return (shortestSide >= kTabletBreakpoint);
}

void openDialog(BuildContext context, Widget widget, {Function(dynamic)? callBack}) {
  if (isTablet(context)) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
                width:
                    MediaQuery.of(context).size.width * kTableWidthPercentage,
                child: widget),
          );
        }).then((value) {
      if (callBack != null) {
        callBack(value);
      }
    });
  } else {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
        return ClipRRect(
          child: SizedBox(
            height: screenHeight - 100,
            child: widget,
          ),
        );
      },
    ).then((value) {
      if (callBack != null) {
        callBack(value);
      }
    });
  }
}
