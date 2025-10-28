import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_sizes.dart';
import '../constants/app_colors.dart';
import 'common_text_widget.dart';

class CommonBottomSheet {
  static Future<void> showModal({
    required BuildContext context,
    required Widget content,
    required String title,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppSizes.radius20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          primary: true,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.hSize24),
                topRight: Radius.circular(AppSizes.hSize24),
              ),
            ),
            padding: EdgeInsets.only(
              top: AppSizes.hSize10,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.hSize16,
                vertical: AppSizes.wSize10,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.hSize10),
                    child: Row(
                      children: [
                        CommonTextWidget(
                          text: title,
                          fontWeight: FontWeight.w600,
                          fontSize: AppSizes.fSize14,
                        ),
                        SizedBox(width: AppSizes.hSize18),
                        Container(
                          height: AppSizes.hSize10,
                          width: AppSizes.hSize10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSizes.hSize10,
                            ),
                            color: AppColors.kWhite,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            FontAwesomeIcons.xmark,
                            color: AppColors.kDarkRed,
                            size: AppSizes.hSize24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.kcDarkGray1Color),
                  content,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
