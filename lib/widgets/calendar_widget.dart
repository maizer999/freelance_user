import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import '../enum/dob_calendar_page.dart';
import '../enum/selectable_data_types.dart';
import '../theme/ui_helper.dart';
import 'common_button_widget.dart';
import 'common_text_widget.dart';
import 'dialog_util.dart';
import 'dob_calendar/view/tabs/gregorian_tab_page.dart';
import 'dob_calendar/view/tabs/hijri_tab_page.dart';

class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget(
      {super.key,
      this.initialSelectedDate,
      required this.onSelectDate,
      required this.selectableDateType,
      this.startDate,
      this.endDate});

  final DateTime? initialSelectedDate;
  final DateTime? startDate;
  final DateTime? endDate;

  final DateSelectableType selectableDateType;

  /// [selectedDate] will be always Gregorian date
  /// [selectedDateAsString] will formatted string according to the type of calendar
  /// [selectedCalendarType] will be the selected calendar
  final void Function(
    ({
      DateTime selectedDate,
      String selectedDateAsString,
      SelectedCalendarType selectedCalendarType
    }),
  ) onSelectDate;

  @override
  ConsumerState<CalendarWidget> createState() => CalendarWidgetState();
}

class CalendarWidgetState extends ConsumerState<CalendarWidget> {
  (
    DateTime selectedDate,
    String selectedDateAsString,
    SelectedCalendarType selectedCalendarType
  )? dateRecord;

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.hSize10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: getBoxShadow(AppColors.kBorderColor),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radius20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.hSize20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius30),
                  color: AppColors.kPrimaryColor,
                ),
                height: AppSizes.hSize4,
                width: AppSizes.wSize30,
              ),
            ),
            AppSizes.height14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                  text: AppStrings.selectDate,
                  fontSize: AppSizes.size16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    MdiIcons.close,
                    color: AppColors.kPrimaryColor,
                    size: AppSizes.size26,
                  ),
                ),
              ],
            ),
            AppSizes.height10,
            Expanded(
                child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Builder(builder: (tabContext) {
                tabController = DefaultTabController.of(tabContext);
                return Column(
                  children: [
                    Stack(
                      children: [
                        TabBar(
                          dividerHeight: 0.002,
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelColor: AppColors.kPrimaryColor,
                          unselectedLabelColor: AppColors.kcDarkGrayColor,
                          labelStyle: TextStyle(
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: AppSizes.size14,
                            fontWeight: FontWeight.normal,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 3,
                              color: AppColors.kPrimaryLight,
                            ),
                          ),
                          tabs: [
                            Tab(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonTextWidget(
                                    color: AppColors.kcDarkGrayColor,
                                    text: AppStrings.gregorianCalendar,
                                    fontSize: AppSizes.size14,
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonTextWidget(
                                    text: AppStrings.hijriCalendar,
                                    color: AppColors.kcDarkGrayColor,
                                    fontSize: AppSizes.size14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          GregorianTabPage(
                            selectableDateType: widget.selectableDateType,
                            initialSelectedDate: widget.initialSelectedDate,
                            startDate: widget.startDate,
                            endDate: widget.endDate,
                            onSelectDate: (date, dateAsString) {
                              setState(() {
                                dateRecord = (
                                  date,
                                  dateAsString,
                                  SelectedCalendarType.gregorian
                                );
                              });
                            },
                          ),
                          HijriTabPage(
                            selectableDateType: widget.selectableDateType,
                            initialSelectedDate: widget.initialSelectedDate,
                            startDate: widget.startDate,
                            endDate: widget.endDate,
                            onSelectDate: (date, dateAsString) {
                              setState(() {
                                dateRecord = (
                                  date,
                                  dateAsString,
                                  SelectedCalendarType.hijri
                                );
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }),
            )),
            CommonButtonWidget(
              text: AppStrings.confirm,
              fontSize: AppSizes.fSize14,
              backgroundColor: AppColors.kPrimaryColor,
              borderRadius: AppSizes.radius6,
              height: AppSizes.hSize50,
              onTap: () async {
                switch (dateRecord) {
                  case (
                      DateTime date,
                      String dateString,
                      final SelectedCalendarType _,
                    ):
                    {
                      showTimePicker(
                        dateTime: date,
                        isShowSeconds: true,
                        onTimeSelected: (dateTime) {
                          widget.onSelectDate(
                            (
                              selectedDate: dateTime,
                              selectedDateAsString: dateString,
                              selectedCalendarType: SelectedCalendarType
                                  .values[tabController?.index ?? 0]
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    }

                  case null:
                    {
                      if ((tabController?.index ?? 0) == 1) {
                        showTimePicker(
                          dateTime:
                              widget.initialSelectedDate ?? DateTime.now(),
                          isShowSeconds: true,
                          onTimeSelected: (dateTime) {
                            widget.onSelectDate(
                              (
                                selectedDate: dateTime,
                                selectedDateAsString:
                                    DateFormat("dd MMMM yyyy").format(dateTime),
                                selectedCalendarType: SelectedCalendarType.hijri
                              ),
                            );

                            Navigator.of(context).pop();
                          },
                        );
                      } else {
                        showTimePicker(
                          dateTime:
                              widget.initialSelectedDate ?? DateTime.now(),
                          isShowSeconds: true,
                          onTimeSelected: (dateTime) async {
                            widget.onSelectDate(
                              (
                                selectedDate: dateTime,
                                selectedDateAsString:
                                    HijriCalendar.fromDate(dateTime)
                                        .toFormat("dd MMMM yyyy")
                                        .toString(),
                                selectedCalendarType:
                                    SelectedCalendarType.gregorian
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void showTimePicker({
    required DateTime dateTime,
    required bool isShowSeconds,
    required void Function(DateTime dateTime) onTimeSelected,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _context) {
        DateTime dateTime0 = dateTime;

        return AlertDialog(
          content: TimePickerSpinner(
            is24HourMode: true,
            normalTextStyle: TextStyle(fontSize: 10, color: Colors.black),
            highlightedTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            spacing: 10,
            itemHeight: 50,
            isShowSeconds: isShowSeconds,
            isForce2Digits: true,
            onTimeChange: (time) {
              dateTime0 = DateTime(
                dateTime0.year,
                dateTime0.month,
                dateTime0.day,
                time.hour,
                time.minute,
                time.second,
              );
            },
          ),
          actions: [
            TextButton(
              child: Text(AppStrings.ok),
              onPressed: () {
                onTimeSelected(dateTime0);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void openCalendarDialog(BuildContext context,
    {    DateTime? initialSelectedDate,
      required void Function(
      ({
        DateTime selectedDate,
        String selectedDateAsString,
        SelectedCalendarType selectedCalendarType
      }),
    ) onSelectDate,
    required DateSelectableType selectableDateType,
    DateTime? startDate,
    DateTime? endDate}) {
  openDialog(
      context,
      CalendarWidget(
        onSelectDate: onSelectDate,
        selectableDateType: selectableDateType,
        initialSelectedDate: initialSelectedDate,
        startDate: startDate,
        endDate: endDate,
      ));
}
