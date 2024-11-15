import 'package:work_hour_calculator/work_hour_calculator.dart';

/// This class defines a single week of working days.
///
/// For example, to define a week of these working hours:
/// - Monday    : 09.00-18.00 (lunch break at 12.00-13.00)
/// - Tuesday   : 09.00-18.00 (lunch break at 12.00-13.00)
/// - Wednesday : 09.00-18.00 (lunch break at 12.00-13.00)
/// - Thursday  : 09.00-18.00 (lunch break at 12.00-13.00)
/// - Friday    : 10.00-17.30 (lunch break at 12.00-13.00)
/// - Saturday  : No work
/// - Sunday    : No work
///
/// you should define the [WorkWeekData] like this:
/// ```
/// var workWeekData = WorkWeekData(
///    workdays: [
///      // Monday
///      WorkDayData(
///        workHours: [
///          WorkHourData(startHour: 9, endHour: 12),
///          WorkHourData(startHour: 13, endHour: 18),
///        ],
///      ),
///      // Tuesday
///      WorkDayData(
///        workHours: [
///          WorkHourData(startHour: 9, endHour: 12),
///          WorkHourData(startHour: 13, endHour: 18),
///        ],
///      ),
///      // Wednesday
///      WorkDayData(
///        workHours: [
///          WorkHourData(startHour: 9, endHour: 12),
///          WorkHourData(startHour: 13, endHour: 18),
///        ],
///      ),
///      // Thursday
///      WorkDayData(
///        workHours: [
///          WorkHourData(startHour: 9, endHour: 12),
///          WorkHourData(startHour: 13, endHour: 18),
///        ],
///      ),
///      // Friday
///      WorkDayData(
///        workHours: [
///          WorkHourData(startHour: 10, endHour: 12),
///          WorkHourData(startHour: 13, endHour: 17, endMinute: 30),
///        ],
///      ),
///      // Saturday
///      WorkDayData(
///        workHours: [],
///      ),
///      // Sunday
///      WorkDayData(
///        workHours: [],
///      ),
///    ],
/// );
/// ```
class WorkWeekData {
  final List<WorkDayData> workdays;

  WorkWeekData({
    required this.workdays,
  }) : assert(
          workdays.length == 7,
          'workdays length should be 7',
        );
}
