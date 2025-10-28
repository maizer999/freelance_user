import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freelance_user/constants/app_strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../helper/data_helper.dart';
import '../theme/ui_helper.dart';
import 'common_button_widget.dart';
import 'common_text_widget.dart';

class CustomFormBuilderMultiSelect extends StatelessWidget {
  final String name;
  final String? label;
  final List<DropDownOption> items;
  final void Function(List<DropDownOption>?)? onChanged;
  final bool readOnly;
  final bool isMandatory;

  const CustomFormBuilderMultiSelect({
    super.key,
    required this.name,
    required this.items,
    this.onChanged,
    this.label,
    this.readOnly = false,
    this.isMandatory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: label?.tr(),
              style: FormBuilderTextStyle.getFormTextStyle(),
              children: [
                if (isMandatory == true)
                  const TextSpan(
                      text: ' *', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          AppSizes.height10,
          FormBuilderField<List<DropDownOption>>(
            name: name,
            enabled: !readOnly,
            onChanged: readOnly ? null : onChanged,
            builder: (FormFieldState<List<DropDownOption>?> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelStyle: FormBuilderTextStyle.getFormTextStyle(),
                  border: BorderStyles.formBorder,
                  enabledBorder: BorderStyles.formBorder,
                  focusedBorder: BorderStyles.formBorder,
                  errorBorder: BorderStyles.errorFormBorder,
                  focusedErrorBorder: BorderStyles.errorFormBorder,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (field.value != null)
                        ? Wrap(
                            spacing: 6,
                            children: field.value!
                                .map((opt) => Chip(
                                      label: CommonTextWidget(
                                        text: opt.name ?? "-",
                                        color: AppColors.kcOrTextColor,
                                        fontSize: AppSizes.fSize10,
                                      ),
                                      backgroundColor: AppColors.kPrimaryColor
                                          .withValues(alpha: 0.3),
                                      deleteIcon:
                                          const Icon(Icons.close, size: 18),
                                      onDeleted: () {
                                        final updated =
                                            List<DropDownOption>.from(
                                                field.value ?? []);
                                        updated.remove(opt);
                                        field.didChange(updated);
                                      },
                                    ))
                                .toList(),
                          )
                        : SizedBox(),
                    (field.value != null) ? SizedBox() : AppSizes.height10,
                    InkWell(
                      onTap: () async {
                        final screenHeight = MediaQuery.of(context).size.height;

                        final selected =
                            await showModalBottomSheet<List<DropDownOption>>(
                          context: field.context,
                          isScrollControlled: true,
                          builder: (context) {
                            final tempSelected =
                                List<DropDownOption>.from(field.value ?? []);

                            return StatefulBuilder(
                              builder: (context, setState) {
                                return SizedBox(
                                  height: screenHeight * 0.8,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: AppSizes.hSize10,
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow:
                                          getBoxShadow(AppColors.kBorderColor),
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(AppSizes.radius20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(AppSizes.hSize20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSizes.radius30),
                                                color: AppColors.kPrimaryColor,
                                              ),
                                              height: AppSizes.hSize4,
                                              width: AppSizes.wSize30,
                                            ),
                                          ),
                                          AppSizes.height14,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonTextWidget(
                                                text:
                                                    "${AppStrings.pleaseSelect} $label",
                                                fontSize: AppSizes.size16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.kPrimaryColor,
                                              ),
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: Icon(
                                                  MdiIcons.close,
                                                  color:
                                                      AppColors.kPrimaryColor,
                                                  size: AppSizes.size26,
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppSizes.height10,
                                          Expanded(
                                            child: ListView(
                                              children: items.map((opt) {
                                                final isSelected =
                                                    tempSelected.contains(opt);
                                                return CheckboxListTile(
                                                  title: CommonTextWidget(
                                                    text: opt.name ?? "",
                                                    fontSize: AppSizes.fSize12,
                                                  ),
                                                  value: isSelected,
                                                  onChanged: (checked) {
                                                    setState(() {
                                                      checked == true
                                                          ? tempSelected
                                                              .add(opt)
                                                          : tempSelected
                                                              .remove(opt);
                                                    });
                                                  },
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          AppSizes.height10,
                                          CommonButtonWidget(
                                            text: AppStrings.done,
                                            fontSize: AppSizes.fSize14,
                                            backgroundColor:
                                                AppColors.kPrimaryColor,
                                            borderRadius: AppSizes.radius6,
                                            height: AppSizes.hSize50,
                                            onTap: () {
                                              Navigator.pop(
                                                  context, tempSelected);
                                            },
                                          ),
                                          AppSizes.height30,
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );

                        if (selected != null) {
                          field.didChange(selected);
                        }
                      },
                      child: CommonTextWidget(
                        text: AppStrings.tapToAdd,
                        color: AppColors.kcOrTextColor,
                        fontSize: AppSizes.fSize12,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ]);
  }
}
