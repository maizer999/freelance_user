/// Enum to specify the selectable date range for the calendar widget.
///
/// This enum is used to determine which dates are selectable in the calendar,
/// based on whether past and/or future dates should be allowed.
///
/// - [DateSelectableType.all] - Allows selection of both past and future dates.
///   This is equivalent to both `isFutureDateSelectable` and `isPastDateSelectable` being true.
/// - [DateSelectableType.futureOnly] - Restricts selection to future dates only.
///   This is equivalent to `isFutureDateSelectable` being true and `isPastDateSelectable` being false.
/// - [DateSelectableType.pastOnly] - Restricts selection to past dates only.
///   This is equivalent to `isFutureDateSelectable` being false and `isPastDateSelectable` being true.
enum DateSelectableType {
  /// Allows selection of both past and future dates.
  ///
  /// The calendar's first date is the default calendar start date, and the
  /// last date is the default calendar end date. This is the broadest range
  /// of selectable dates.
  all,

  /// Allows selection of only future dates.
  ///
  /// The calendar's first date is the default calendar start date, and the
  /// last date is the `initialDate`. This prevents selecting any date in the past.
  futureOnly,

  /// Allows selection of only past dates.
  ///
  /// The calendar's first date is the `initialDate`, and the last date is the
  /// default calendar end date. This prevents selecting any future dates.
  pastOnly,
  dateRange,

}
