import 'package:work_hour_calculator/work_hour_calculator.dart';

/// This class contains the main method to calculate working hours.
///
/// Typically, you only need to use the [calculateWorkHours] method:
/// ```
/// void main() {
///   var workWeekData = WorkWeekData(
///     // ...
///   );
///   final calculator = WorkHourCalculator();
///   var workHours = calculator.calculateWorkHours(
///       startDateTime,
///       endDateTime,
///       workWeekData,
///   );
/// }
/// ```
class WorkHourCalculator {
  /// Returns true if [start] and [end] are the same day.
  bool isSameDay(DateTime start, DateTime end) =>
      start.year == end.year &&
      start.month == end.month &&
      start.day == end.day;

  /// Calculates work hours within a single [WorkHourData].
  Duration calculateWorkHoursInOneSession(
    DateTime start,
    DateTime end,
    WorkHourData workHourData,
  ) {
    if (start.isAfter(end)) {
      throw ArgumentError('start cannot be after end!');
    }
    if (!isSameDay(start, end)) {
      throw ArgumentError('start and end must be same day!');
    }
    var workHourStart = start.copyWith(
      hour: workHourData.startHour,
      minute: workHourData.startMinute,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    var workHourEnd = start.copyWith(
      hour: workHourData.endHour,
      minute: workHourData.endMinute,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    if (start.isAfter(workHourEnd)) {
      return Duration.zero;
    } else if (end.isBefore(workHourStart)) {
      return Duration.zero;
    }
    DateTime s = start;
    if (start.isBefore(workHourStart)) {
      s = workHourStart;
    }
    DateTime e = end;
    if (end.isAfter(workHourEnd)) {
      e = workHourEnd;
    }
    return e.difference(s);
  }

  /// Calculates work hours within a single [WorkDayData].
  Duration calculateWorkHoursInOneDay(
    DateTime start,
    DateTime end,
    WorkDayData workDayData,
  ) {
    if (start.isAfter(end)) {
      throw ArgumentError('start cannot be after end!');
    }
    if (!isSameDay(start, end)) {
      throw ArgumentError('start and end must be same day!');
    }
    Duration total = Duration.zero;
    for (var workHourData in workDayData.workHours) {
      total += calculateWorkHoursInOneSession(start, end, workHourData);
    }
    return total;
  }

  WorkDayData _getWorkDayData(
    WorkWeekData workWeekData,
    DateTime date,
    Map<DateTime, WorkDayData>? specialDates,
  ) {
    if (specialDates != null) {
      try {
        DateTime specialDate = specialDates.keys
            .firstWhere((specialDate) => isSameDay(date, specialDate));
        return specialDates[specialDate]!;
      } on StateError catch (_) {
        // No special date found
      }
    }
    var index = date.weekday - 1;
    return workWeekData.workdays[index];
  }

  /// Calculates work hours within a single [WorkWeekData].
  Duration calculateWorkHours(
    DateTime start,
    DateTime end,
    WorkWeekData workWeekData, {
    Map<DateTime, WorkDayData>? specialDates,
  }) {
    if (start.isAfter(end)) {
      throw ArgumentError('start cannot be after end!');
    }
    if (isSameDay(start, end)) {
      var workDayData = _getWorkDayData(workWeekData, start, specialDates);
      return calculateWorkHoursInOneDay(start, end, workDayData);
    }
    Duration total = Duration.zero;
    DateTime day = start;
    DateTime lastDay = end.add(const Duration(days: 1));
    do {
      var workDayData = _getWorkDayData(workWeekData, day, specialDates);
      var s = DateTime(day.year, day.month, day.day);
      if (isSameDay(start, day)) {
        s = start;
      }
      var e = DateTime(day.year, day.month, day.day, 23, 59, 59);
      if (isSameDay(day, end)) {
        e = end;
      }
      var x = calculateWorkHoursInOneDay(s, e, workDayData);
      total += x;
      day = day.add(const Duration(days: 1));
    } while (!isSameDay(day, lastDay));

    return total;
  }
}
