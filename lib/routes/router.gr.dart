// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:freelance_user/enum/selectable_data_types.dart' as _i7;
import 'package:freelance_user/widgets/common_dialog_view.dart' as _i1;
import 'package:freelance_user/widgets/dob_calendar/view/tabs/gregorian_tab_page.dart'
    as _i3;
import 'package:freelance_user/widgets/dob_calendar/view/tabs/hijri_tab_page.dart'
    as _i4;
import 'package:freelance_user/widgets/dob_calendar_page.dart' as _i2;

/// generated route for
/// [_i1.CommonResponseDialogView]
class CommonResponseDialogRoute
    extends _i5.PageRouteInfo<CommonResponseDialogRouteArgs> {
  CommonResponseDialogRoute({
    _i6.Key? key,
    String? responseMessage,
    String? statusCode,
    String? buttonText,
    _i6.VoidCallback? onTap,
    double? width,
    double? height,
    String? routePage,
    String? loadingMessage,
    bool isLoading = false,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CommonResponseDialogRoute.name,
          args: CommonResponseDialogRouteArgs(
            key: key,
            responseMessage: responseMessage,
            statusCode: statusCode,
            buttonText: buttonText,
            onTap: onTap,
            width: width,
            height: height,
            routePage: routePage,
            loadingMessage: loadingMessage,
            isLoading: isLoading,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonResponseDialogRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommonResponseDialogRouteArgs>(
        orElse: () => const CommonResponseDialogRouteArgs(),
      );
      return _i1.CommonResponseDialogView(
        key: args.key,
        responseMessage: args.responseMessage,
        statusCode: args.statusCode,
        buttonText: args.buttonText,
        onTap: args.onTap,
        width: args.width,
        height: args.height,
        routePage: args.routePage,
        loadingMessage: args.loadingMessage,
        isLoading: args.isLoading,
      );
    },
  );
}

class CommonResponseDialogRouteArgs {
  const CommonResponseDialogRouteArgs({
    this.key,
    this.responseMessage,
    this.statusCode,
    this.buttonText,
    this.onTap,
    this.width,
    this.height,
    this.routePage,
    this.loadingMessage,
    this.isLoading = false,
  });

  final _i6.Key? key;

  final String? responseMessage;

  final String? statusCode;

  final String? buttonText;

  final _i6.VoidCallback? onTap;

  final double? width;

  final double? height;

  final String? routePage;

  final String? loadingMessage;

  final bool isLoading;

  @override
  String toString() {
    return 'CommonResponseDialogRouteArgs{key: $key, responseMessage: $responseMessage, statusCode: $statusCode, buttonText: $buttonText, onTap: $onTap, width: $width, height: $height, routePage: $routePage, loadingMessage: $loadingMessage, isLoading: $isLoading}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommonResponseDialogRouteArgs) return false;
    return key == other.key &&
        responseMessage == other.responseMessage &&
        statusCode == other.statusCode &&
        buttonText == other.buttonText &&
        onTap == other.onTap &&
        width == other.width &&
        height == other.height &&
        routePage == other.routePage &&
        loadingMessage == other.loadingMessage &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      responseMessage.hashCode ^
      statusCode.hashCode ^
      buttonText.hashCode ^
      onTap.hashCode ^
      width.hashCode ^
      height.hashCode ^
      routePage.hashCode ^
      loadingMessage.hashCode ^
      isLoading.hashCode;
}

/// generated route for
/// [_i2.DobCalendarPage]
class DobCalendarRoute extends _i5.PageRouteInfo<DobCalendarRouteArgs> {
  DobCalendarRoute({
    _i6.Key? key,
    DateTime? initialSelectedDate,
    required void Function(
      ({
        _i2.SelectedCalendarType selectedCalendarType,
        DateTime selectedDate,
        String selectedDateAsString,
      }),
    ) onSelectDate,
    required _i7.DateSelectableType selectableDateType,
    DateTime? startDate,
    DateTime? endDate,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DobCalendarRoute.name,
          args: DobCalendarRouteArgs(
            key: key,
            initialSelectedDate: initialSelectedDate,
            onSelectDate: onSelectDate,
            selectableDateType: selectableDateType,
            startDate: startDate,
            endDate: endDate,
          ),
          initialChildren: children,
        );

  static const String name = 'DobCalendarRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DobCalendarRouteArgs>();
      return _i2.DobCalendarPage(
        key: args.key,
        initialSelectedDate: args.initialSelectedDate,
        onSelectDate: args.onSelectDate,
        selectableDateType: args.selectableDateType,
        startDate: args.startDate,
        endDate: args.endDate,
      );
    },
  );
}

class DobCalendarRouteArgs {
  const DobCalendarRouteArgs({
    this.key,
    this.initialSelectedDate,
    required this.onSelectDate,
    required this.selectableDateType,
    this.startDate,
    this.endDate,
  });

  final _i6.Key? key;

  final DateTime? initialSelectedDate;

  final void Function(
    ({
      _i2.SelectedCalendarType selectedCalendarType,
      DateTime selectedDate,
      String selectedDateAsString,
    }),
  ) onSelectDate;

  final _i7.DateSelectableType selectableDateType;

  final DateTime? startDate;

  final DateTime? endDate;

  @override
  String toString() {
    return 'DobCalendarRouteArgs{key: $key, initialSelectedDate: $initialSelectedDate, onSelectDate: $onSelectDate, selectableDateType: $selectableDateType, startDate: $startDate, endDate: $endDate}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DobCalendarRouteArgs) return false;
    return key == other.key &&
        initialSelectedDate == other.initialSelectedDate &&
        selectableDateType == other.selectableDateType &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      initialSelectedDate.hashCode ^
      selectableDateType.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
}

/// generated route for
/// [_i3.GregorianTabPage]
class GregorianTabRoute extends _i5.PageRouteInfo<GregorianTabRouteArgs> {
  GregorianTabRoute({
    _i6.Key? key,
    DateTime? initialSelectedDate,
    bool showHeader = false,
    required void Function(DateTime, String) onSelectDate,
    required _i7.DateSelectableType selectableDateType,
    DateTime? startDate,
    DateTime? endDate,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          GregorianTabRoute.name,
          args: GregorianTabRouteArgs(
            key: key,
            initialSelectedDate: initialSelectedDate,
            showHeader: showHeader,
            onSelectDate: onSelectDate,
            selectableDateType: selectableDateType,
            startDate: startDate,
            endDate: endDate,
          ),
          initialChildren: children,
        );

  static const String name = 'GregorianTabRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GregorianTabRouteArgs>();
      return _i3.GregorianTabPage(
        key: args.key,
        initialSelectedDate: args.initialSelectedDate,
        showHeader: args.showHeader,
        onSelectDate: args.onSelectDate,
        selectableDateType: args.selectableDateType,
        startDate: args.startDate,
        endDate: args.endDate,
      );
    },
  );
}

class GregorianTabRouteArgs {
  const GregorianTabRouteArgs({
    this.key,
    this.initialSelectedDate,
    this.showHeader = false,
    required this.onSelectDate,
    required this.selectableDateType,
    this.startDate,
    this.endDate,
  });

  final _i6.Key? key;

  final DateTime? initialSelectedDate;

  final bool showHeader;

  final void Function(DateTime, String) onSelectDate;

  final _i7.DateSelectableType selectableDateType;

  final DateTime? startDate;

  final DateTime? endDate;

  @override
  String toString() {
    return 'GregorianTabRouteArgs{key: $key, initialSelectedDate: $initialSelectedDate, showHeader: $showHeader, onSelectDate: $onSelectDate, selectableDateType: $selectableDateType, startDate: $startDate, endDate: $endDate}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GregorianTabRouteArgs) return false;
    return key == other.key &&
        initialSelectedDate == other.initialSelectedDate &&
        showHeader == other.showHeader &&
        selectableDateType == other.selectableDateType &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      initialSelectedDate.hashCode ^
      showHeader.hashCode ^
      selectableDateType.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
}

/// generated route for
/// [_i4.HijriTabPage]
class HijriTabRoute extends _i5.PageRouteInfo<HijriTabRouteArgs> {
  HijriTabRoute({
    _i6.Key? key,
    DateTime? initialSelectedDate,
    required void Function(DateTime, String) onSelectDate,
    required _i7.DateSelectableType selectableDateType,
    DateTime? startDate,
    DateTime? endDate,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HijriTabRoute.name,
          args: HijriTabRouteArgs(
            key: key,
            initialSelectedDate: initialSelectedDate,
            onSelectDate: onSelectDate,
            selectableDateType: selectableDateType,
            startDate: startDate,
            endDate: endDate,
          ),
          initialChildren: children,
        );

  static const String name = 'HijriTabRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HijriTabRouteArgs>();
      return _i4.HijriTabPage(
        key: args.key,
        initialSelectedDate: args.initialSelectedDate,
        onSelectDate: args.onSelectDate,
        selectableDateType: args.selectableDateType,
        startDate: args.startDate,
        endDate: args.endDate,
      );
    },
  );
}

class HijriTabRouteArgs {
  const HijriTabRouteArgs({
    this.key,
    this.initialSelectedDate,
    required this.onSelectDate,
    required this.selectableDateType,
    this.startDate,
    this.endDate,
  });

  final _i6.Key? key;

  final DateTime? initialSelectedDate;

  final void Function(DateTime, String) onSelectDate;

  final _i7.DateSelectableType selectableDateType;

  final DateTime? startDate;

  final DateTime? endDate;

  @override
  String toString() {
    return 'HijriTabRouteArgs{key: $key, initialSelectedDate: $initialSelectedDate, onSelectDate: $onSelectDate, selectableDateType: $selectableDateType, startDate: $startDate, endDate: $endDate}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HijriTabRouteArgs) return false;
    return key == other.key &&
        initialSelectedDate == other.initialSelectedDate &&
        selectableDateType == other.selectableDateType &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      initialSelectedDate.hashCode ^
      selectableDateType.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
}
