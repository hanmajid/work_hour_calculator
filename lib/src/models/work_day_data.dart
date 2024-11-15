import 'package:work_hour_calculator/work_hour_calculator.dart';

/// This class defines a single day of working hours.
///
/// For example, to define a day of working hours from 09.00 to 12.00 
/// and 13.00 to 18.00 (lunch break from 12.00 to 13.00), you
/// should define the [WorkDayData] like this:
/// ```
/// var data = WorkDayData(
///   workHours: [
///     WorkHourData(
///       startHour: 9,
///       endHour: 12,
///     ),
///     WorkHourData(
///       startHour: 13,
///       endHour: 18,
///     ),
///   ],
/// );
/// ```
/// 
/// If [workHours] is empty, then there are no working hours,
/// for example for weekends.
class WorkDayData {
  final List<WorkHourData> workHours;

  WorkDayData({
    required this.workHours,
  });
}
