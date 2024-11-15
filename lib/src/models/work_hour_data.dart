/// This class defines a single session of working hour.
///
/// For example, to define working hour from 09.30 to 10.45, you
/// should define the [WorkHourData] like this:
/// ```
/// var data = WorkHourData(
///   startHour: 9,
///   startMinute: 30,
///   endHour: 10,
///   endMinute: 45,
/// );
/// ```
class WorkHourData {
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  WorkHourData({
    required this.startHour,
    required this.endHour,
    this.startMinute = 0,
    this.endMinute = 0,
  })  : assert(
          startHour >= 0 && startHour <= 23,
          'startHour should be between 0 and 23',
        ),
        assert(
          endHour >= 0 && endHour <= 23,
          'endHour should be between 0 and 23',
        ),
        assert(
          startMinute >= 0 && startMinute <= 59,
          'startMinute should be between 0 and 59',
        ),
        assert(
          endMinute >= 0 && endMinute <= 59,
          'endMinute should be between 0 and 59',
        ),
        assert(
          DateTime(2000, 1, 1, startHour, startMinute)
              .isBefore(DateTime(2000, 1, 1, endHour, endMinute)),
          'startHour & startMinute should be before endHour & endMinute',
        );
}
