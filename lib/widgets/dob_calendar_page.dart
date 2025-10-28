import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../enum/selectable_data_types.dart';
import '../routes/router.gr.dart';
import 'dob_calendar/view/widget/dob_calendar_tabs.dart';

enum SelectedCalendarType {
  gregorian,
  hijri,
}

@RoutePage()
class DobCalendarPage extends StatefulWidget {
  const DobCalendarPage(
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
  State<DobCalendarPage> createState() => _DobCalendarPageState();
}

class _DobCalendarPageState extends State<DobCalendarPage> {
  (
    DateTime selectedDate,
    String selectedDateAsString,
    SelectedCalendarType selectedCalendarType
  )? dateRecord;

  void showTimePicker({
    required DateTime dateTime,
    required bool isShowSeconds,
    required void Function(DateTime dateTime) onTimeSelected,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [
        GregorianTabRoute(
          selectableDateType: widget.selectableDateType,
          initialSelectedDate: widget.initialSelectedDate,
          startDate: widget.startDate,
          endDate: widget.endDate,
          onSelectDate: (date, dateAsString) {
            setState(() {
              dateRecord = (date, dateAsString, SelectedCalendarType.gregorian);
            });
          },
        ),
        HijriTabRoute(
          selectableDateType: widget.selectableDateType,
          initialSelectedDate: widget.initialSelectedDate,
          startDate: widget.startDate,
          endDate: widget.endDate,
          onSelectDate: (date, dateAsString) {
            setState(() {
              dateRecord = (date, dateAsString, SelectedCalendarType.hijri);
            });
          },
        ),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AutoLeadingButton(color: Colors.white),
            title: "Select Date".text.make(),
            bottom: DobCalendarTabs(tabController: controller),
          ),
          body: child,
          floatingActionButton: Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.greenyBlue,
                elevation: 0,
                minimumSize: Size(context.screenWidth * 0.8, 48),
              ),
              onPressed: () async {
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
                              selectedCalendarType:
                                  SelectedCalendarType.values[controller.index]
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    }

                  case null:
                    {
                      if (controller.index == 1) {
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
              child: "Confirm".text.make(),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ).safeArea();
      },
    );
  }
}
