import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CommonCircularProgress extends StatelessWidget {
  double? strokeAlign = 2;

  CommonCircularProgress({super.key, this.strokeAlign =2});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimaryColor),
      strokeWidth: 8.0,
      strokeAlign: strokeAlign,
    ));
  }
}

class CommonCircularProgressList extends StatelessWidget {
  const CommonCircularProgressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      alignment: AlignmentDirectional.center,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimaryLight),
        strokeWidth: 8.0,
        strokeAlign: 1,
      ),
    );
  }
}

Widget getCircularProgress(int currentPage) {
  if (currentPage == 0) {
    return CommonCircularProgress();
  } else {
    return CommonCircularProgressList();
  }
}

class CommonProgressDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: null,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: Container(
                padding: const EdgeInsets.all(30),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CommonCircularProgress()),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
