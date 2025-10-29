import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../constants/app_colors.dart';
import '../../../../enum/selectable_data_types.dart';

@RoutePage()
class HijriTabPage extends StatefulWidget {
  const HijriTabPage({
    super.key,
     this.initialSelectedDate,
    required this.onSelectDate,
    required this.selectableDateType,
    this.startDate,
    this.endDate
  });
  final DateTime? initialSelectedDate;
  final DateSelectableType selectableDateType;
  final DateTime? startDate;
  final DateTime? endDate;

  final void Function(DateTime selectedDate, String selectedDateInString)
      onSelectDate;

  @override
  State<HijriTabPage> createState() => _HijriTabPageState();
}

class _HijriTabPageState extends State<HijriTabPage> {
  late HijriCalendar selectedDate;

  HijriCalendar getFirstDate() {
    return switch (widget.selectableDateType) {
      /// Allow all dates (starting from a past date)
      DateSelectableType.all => HijriCalendar()
        ..hYear = 1416
        ..hMonth = 1
        ..hDay = 1,
      // Start from the initial date (assumed to be in the future)
      DateSelectableType.futureOnly =>
        HijriCalendar.fromDate(DateTime.now()),
      // Start from the earliest possible date
      DateSelectableType.pastOnly => HijriCalendar()
        ..hYear = 1416
        ..hMonth = 1
        ..hDay = 1,
      DateSelectableType.dateRange =>
          HijriCalendar.fromDate(widget.startDate ?? DateTime.now()),
    };
  }

  HijriCalendar getLastDate() {
    return switch (widget.selectableDateType) {
      // Allow all dates (up to a future date)
      DateSelectableType.all => HijriCalendar()
        ..hYear = 1467
        ..hMonth = 1
        ..hDay = 1,
      // Up to the latest possible future date
      DateSelectableType.futureOnly => HijriCalendar()
        ..hYear = 1467
        ..hMonth = 1
        ..hDay = 1,
      // Up to the initial selected date (assumed to be in the past)
      DateSelectableType.pastOnly =>
        HijriCalendar.fromDate(DateTime.now()),
      DateSelectableType.dateRange =>
          HijriCalendar.fromDate(widget.endDate ?? DateTime.now()),
    };
  }

  Future<void> _selectDate() async {
    // var language = Localizations.localeOf(context).languageCode;
    final HijriCalendar? picked = await showHijriDatePicker(
      locale: Locale('en'),
      context: context,
      initialDate: selectedDate,
      lastDate: getLastDate(),
      firstDate: getFirstDate(),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    selectedDate = HijriCalendar.fromDate(widget.initialSelectedDate ?? DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextButton(
        onPressed: () {
          _selectDate();
        },
        child: selectedDate
            .toFormat("dd MMMM yyyy")
            .toString()
            .text
            .xl2
            .bold
            .make(),
      ),
      Divider(
        thickness: 1,
        color: AppColors.kPrimaryColor,
      ),
      Builder(
        builder: (context) {
          HijriCalendar.setLocal('en');
          return HijriMonthPicker(
            lastDate: getLastDate(),
            firstDate: getFirstDate(),
            onChanged: (HijriCalendar value) {
              setState(() {
                selectedDate = value;
              });

              widget.onSelectDate(
                selectedDate.hijriToGregorian(
                  selectedDate.hYear,
                  selectedDate.hMonth,
                  selectedDate.hDay,
                ),
                selectedDate.toFormat("dd MMMM yyyy"),
              );
            },
            selectedDate: selectedDate,
          );
        },
      ),
    ]
        .vStack(
          crossAlignment: CrossAxisAlignment.stretch,
        )
        .scrollVertical();
  }
}
