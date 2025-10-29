import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:freelance_user/widgets/dob_calendar/extension/hjri_calendar_extension.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../enum/selectable_data_types.dart';

@RoutePage()
class GregorianTabPage extends StatefulWidget {
  const GregorianTabPage(
      {super.key,
      this.initialSelectedDate,
      this.showHeader = false,
      required this.onSelectDate,
      required this.selectableDateType,
      this.startDate,
      this.endDate});

  final DateTime? initialSelectedDate;
  final DateTime? startDate;
  final DateTime? endDate;

  final bool showHeader;
  final DateSelectableType selectableDateType;
  final void Function(
    DateTime selectedDate,
    String selectedDateInString,
  ) onSelectDate;

  @override
  State<GregorianTabPage> createState() => _GregorianTabPageState();
}

class _GregorianTabPageState extends State<GregorianTabPage> {
  late DateTime? _currentDate;
  late DateTime _targetDateTime = DateTime.now();

  DateTime getFirstDate() {
    return switch (widget.selectableDateType) {
      /// Allow all dates (starting from a past date)
      DateSelectableType.all => (HijriCalendar()
            ..hYear = 1416
            ..hMonth = 1
            ..hDay = 1)
          .convertToGregorian(),
      DateSelectableType.futureOnly =>
        HijriCalendar.fromDate(DateTime.now()).convertToGregorian(),
      DateSelectableType.pastOnly => (HijriCalendar()
            ..hYear = 1416
            ..hMonth = 1
            ..hDay = 1)
          .convertToGregorian(),
      DateSelectableType.dateRange =>
        HijriCalendar.fromDate(widget.startDate ?? DateTime.now())
            .convertToGregorian(),
    };
  }

  DateTime getLastDate() {
    return switch (widget.selectableDateType) {
      // Allow all dates (up to a future date)
      DateSelectableType.all => (HijriCalendar()
            ..hYear = 1467
            ..hMonth = 1
            ..hDay = 1)
          .convertToGregorian(),
      DateSelectableType.futureOnly => (HijriCalendar()
            ..hYear = 1467
            ..hMonth = 1
            ..hDay = 1)
          .convertToGregorian(),
      DateSelectableType.pastOnly =>
        HijriCalendar.fromDate(DateTime.now()).convertToGregorian(),
      DateSelectableType.dateRange =>
        HijriCalendar.fromDate(widget.endDate ?? DateTime.now())
            .convertToGregorian(),
    };
  }

  @override
  void initState() {
    _currentDate = widget.initialSelectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSizes.height10,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            DateFormat(DateFormat.ABBR_MONTH, 'en')
                .format(_targetDateTime)
                .text
                .xl2
                .bold
                .make(),
            const SizedBox(
              width: 16,
            ),
            Icon(
              Icons.arrow_back_ios_sharp,
              color: AppColors.kPrimaryLight,
              size: 12,
            ).circle(radius: 24, backgroundColor: AppColors.iceBlue).onTap(() {
              setState(() {
                _targetDateTime =
                    DateTime(_targetDateTime.year, _targetDateTime.month - 1);
              });
            }),
            const SizedBox(
              width: 6,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: AppColors.kPrimaryLight,
              size: 12,
            ).circle(radius: 24, backgroundColor: AppColors.iceBlue).onTap(() {
              setState(() {
                _targetDateTime =
                    DateTime(_targetDateTime.year, _targetDateTime.month + 1);
              });
            }),
          ]),
          Row(
            children: [
              DateFormat(DateFormat.YEAR, 'en')
                  .format(_targetDateTime)
                  .text
                  .xl2
                  .bold
                  .make(),
              const SizedBox(
                width: 20,
              ),
              Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.kPrimaryLight,
                size: 12,
              )
                  .circle(radius: 24, backgroundColor: AppColors.iceBlue)
                  .onLongPress(
                () {
                  setState(() {
                    _targetDateTime = DateTime(
                      _targetDateTime.year - 10,
                      _targetDateTime.month,
                    );
                  });
                },
                const ValueKey('reduce'),
              ).onTap(() {
                setState(() {
                  _targetDateTime =
                      DateTime(_targetDateTime.year - 1, _targetDateTime.month);
                });
              }),
              const SizedBox(
                width: 6,
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.kPrimaryLight,
                size: 12,
              )
                  .circle(radius: 24, backgroundColor: AppColors.iceBlue)
                  .onLongPress(
                () {
                  setState(() {
                    _targetDateTime = DateTime(
                      _targetDateTime.year + 10,
                      _targetDateTime.month,
                    );
                  });
                },
                const ValueKey('add'),
              ).onTap(() {
                setState(() {
                  _targetDateTime =
                      DateTime(_targetDateTime.year + 1, _targetDateTime.month);
                });
              }),
            ],
          )
        ]),
        const Divider(
          color: AppColors.kPrimaryColor,
          thickness: 1,
        ),
        Expanded(
            child: CalendarCarousel<Event>(
          todayBorderColor: AppColors.calendarSelected,
          onDayPressed: (DateTime date, List<Event> events) {
            setState(() {
              _currentDate = date;
            });
            widget.onSelectDate(date, DateFormat('dd MMMM yyyy').format(date));
          },
          locale: 'en',
          showOnlyCurrentMonthDate: true,
          weekendTextStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          thisMonthDayBorderColor: AppColors.darkGrey,
          weekFormat: false,
          selectedDateTime: _currentDate,
          targetDateTime: _targetDateTime,
          customGridViewPhysics: const NeverScrollableScrollPhysics(),
          showHeader: widget.showHeader,
          selectedDayBorderColor: AppColors.calendarSelected,
          selectedDayButtonColor: AppColors.calendarSelected,
          daysTextStyle: context.bodySmall,
          weekdayTextStyle: context.bodyMedium,
          inactiveDaysTextStyle:
              context.bodySmall?.copyWith(color: Colors.grey),
          inactiveWeekendTextStyle:
              context.bodySmall?.copyWith(color: Colors.grey),
          todayButtonColor: AppColors.kPrimaryLight.withValues(alpha: 0.2),
          minSelectedDate: getFirstDate(),
          maxSelectedDate: getLastDate(),
          customDayBuilder: (
            isSelectable,
            index,
            isSelectedDay,
            isToday,
            isPrevMonthDay,
            textStyle,
            isNextMonthDay,
            isThisMonthDay,
            day,
          ) {
            return DateFormat.d('en')
                .format(day)
                .text
                .textStyle(textStyle)
                .makeCentered();
          },
          onCalendarChanged: (DateTime date) {
            setState(() {
              _targetDateTime = date;
            });
          },
        )),
      ],
    );
  }
}
