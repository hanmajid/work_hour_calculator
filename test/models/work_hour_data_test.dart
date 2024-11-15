import 'package:flutter_test/flutter_test.dart';
import 'package:work_hour_calculator/work_hour_calculator.dart';

void main() {
  group('WorkHourData', () {
    test('should construct instance normally (required only parameters)', () {
      var workHourData = WorkHourData(
        startHour: 9,
        endHour: 10,
      );
      expect(workHourData.startHour, 9);
      expect(workHourData.endHour, 10);
    });
    test('should construct instance normally', () {
      var workHourData = WorkHourData(
        startHour: 9,
        startMinute: 30,
        endHour: 10,
        endMinute: 45,
      );
      expect(workHourData.startHour, 9);
      expect(workHourData.startMinute, 30);
      expect(workHourData.endHour, 10);
      expect(workHourData.endMinute, 45);
    });
    test('should throw error if startHour is not between 0 and 23', () {
      expect(
        () => WorkHourData(
          startHour: -1,
          endHour: 9,
        ),
        throwsAssertionError,
      );
      expect(
        () => WorkHourData(
          startHour: 24,
          endHour: 9,
        ),
        throwsAssertionError,
      );
    });
    test('should throw error if endHour is not between 0 and 23', () {
      expect(
        () => WorkHourData(
          startHour: 9,
          endHour: -1,
        ),
        throwsAssertionError,
      );
      expect(
        () => WorkHourData(
          startHour: 9,
          endHour: 24,
        ),
        throwsAssertionError,
      );
    });
    test('should throw error if startMinute is not between 0 and 59', () {
      expect(
        () => WorkHourData(
          startHour: 9,
          startMinute: -1,
          endHour: 10,
        ),
        throwsAssertionError,
      );
      expect(
        () => WorkHourData(
          startHour: 9,
          startMinute: 60,
          endHour: 10,
        ),
        throwsAssertionError,
      );
    });
    test('should throw error if endMinute is not between 0 and 59', () {
      expect(
        () => WorkHourData(
          startHour: 9,
          endHour: 10,
          endMinute: -1,
        ),
        throwsAssertionError,
      );
      expect(
        () => WorkHourData(
          startHour: 9,
          endHour: 10,
          endMinute: 60,
        ),
        throwsAssertionError,
      );
    });
    test('should throw error if start > end', () {
      expect(
        () => WorkHourData(
          startHour: 10,
          endHour: 9,
        ),
        throwsAssertionError,
      );
    });
  });
}
