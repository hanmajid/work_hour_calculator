import 'package:flutter_test/flutter_test.dart';
import 'package:work_hour_calculator/work_hour_calculator.dart';

void main() {
  group('WorkDayData', () {
    test('should construct instance normally (with workHours)', () {
      var workDayData = WorkDayData(
        workHours: [
          WorkHourData(
            startHour: 9,
            endHour: 12,
          ),
          WorkHourData(
            startHour: 13,
            endHour: 18,
          ),
        ],
      );
      expect(workDayData.workHours.length, 2);
    });
    test('should construct instance normally', () {
      var workDayData = WorkDayData(
        workHours: [],
      );
      expect(workDayData.workHours.length, 0);
    });
  });
}
