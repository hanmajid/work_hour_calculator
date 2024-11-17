import 'package:flutter_test/flutter_test.dart';
import 'package:work_hour_calculator/work_hour_calculator.dart';

void main() {
  group('WorkHourCalculator', () {
    final calculator = WorkHourCalculator();
    group('isSameDay', () {
      test('should return true if same day', () {
        var start = DateTime(2000, 1, 1, 10, 30);
        var end = DateTime(2000, 1, 1, 11, 45);

        expect(calculator.isSameDay(start, end), true);
      });
      test('should return false if different day', () {
        var start = DateTime(2000, 1, 1, 10, 30);
        var end = DateTime(2000, 1, 2, 11, 45);

        expect(calculator.isSameDay(start, end), false);
        start = DateTime(2000, 1, 1, 10, 30);
        end = DateTime(2000, 2, 1, 11, 45);

        expect(calculator.isSameDay(start, end), false);
        start = DateTime(2000, 1, 1, 10, 30);
        end = DateTime(2001, 1, 1, 11, 45);

        expect(calculator.isSameDay(start, end), false);
      });
    });
    group('calculateWorkHoursInOneSession', () {
      var data = WorkHourData(startHour: 9, endHour: 12);
      test('should return correctly within the work hour', () {
        var start = DateTime(2000, 1, 1, 9, 30);
        var end = DateTime(2000, 1, 1, 11, 45);

        expect(
          calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          const Duration(hours: 2, minutes: 15),
        );
      });
      test('should return correctly outside the work hour', () {
        var start = DateTime(2000, 1, 1, 7, 30);
        var end = DateTime(2000, 1, 1, 8, 45);

        expect(
          calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          Duration.zero,
        );
        start = DateTime(2000, 1, 1, 12, 30);
        end = DateTime(2000, 1, 1, 13, 45);

        expect(
          calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          Duration.zero,
        );
      });
      test('should return correctly if intersect with the work hour', () {
        var start = DateTime(2000, 1, 1, 7, 30);
        var end = DateTime(2000, 1, 1, 10, 45);

        expect(
          calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          const Duration(hours: 1, minutes: 45),
        );
        start = DateTime(2000, 1, 1, 10, 30);
        end = DateTime(2000, 1, 1, 13, 45);

        expect(
          calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          const Duration(hours: 1, minutes: 30),
        );
      });
      test('should throw error if start is after end', () {
        var start = DateTime(2000, 1, 1, 10, 45);
        var end = DateTime(2000, 1, 1, 7, 30);

        expect(
          () => calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          throwsArgumentError,
        );
      });
      test('should throw error if start is not the same day as end', () {
        var start = DateTime(2000, 1, 1, 7, 30);
        var end = DateTime(2000, 1, 2, 10, 45);

        expect(
          () => calculator.calculateWorkHoursInOneSession(
            start,
            end,
            data,
          ),
          throwsArgumentError,
        );
      });
    });
    group('calculateWorkHoursInOneDay', () {
      var data = WorkDayData(
        workHours: [
          WorkHourData(startHour: 9, endHour: 12),
          WorkHourData(startHour: 13, endHour: 18),
        ],
      );
      test('should return correctly within the work day', () {
        var start = DateTime(2000, 1, 1, 9, 30);
        var end = DateTime(2000, 1, 1, 17, 45);

        expect(
          calculator.calculateWorkHoursInOneDay(
            start,
            end,
            data,
          ),
          const Duration(hours: 7, minutes: 15),
        );
      });
      test('should throw error if start is after end', () {
        var start = DateTime(2000, 1, 1, 10, 45);
        var end = DateTime(2000, 1, 1, 7, 30);

        expect(
          () => calculator.calculateWorkHoursInOneDay(
            start,
            end,
            data,
          ),
          throwsArgumentError,
        );
      });
      test('should throw error if start is not the same day as end', () {
        var start = DateTime(2000, 1, 1, 7, 30);
        var end = DateTime(2000, 1, 2, 10, 45);

        expect(
          () => calculator.calculateWorkHoursInOneDay(
            start,
            end,
            data,
          ),
          throwsArgumentError,
        );
      });
    });
    group('calculateWorkHours', () {
      var data = WorkWeekData(
        workdays: [
          // Monday
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12), // 09.00-12.00
              WorkHourData(startHour: 13, endHour: 18), // 13.00-18.00
            ],
          ),
          // Tuesday
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          // Wednesday
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          // Thursday
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          // Friday
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          // Saturday
          WorkDayData(
            workHours: [],
          ),
          // Sunday
          WorkDayData(
            workHours: [],
          ),
        ],
      );
      test('should return correctly within the work week (same day)', () {
        var start = DateTime(2024, 10, 17, 10, 15);
        var end = DateTime(2024, 10, 17, 15, 30);

        expect(
          calculator.calculateWorkHours(
            start,
            end,
            data,
          ),
          const Duration(hours: 4, minutes: 15),
        );
      });
      test('should return correctly within the work week', () {
        var start = DateTime(2024, 10, 17, 15, 17);
        var end = DateTime(2024, 10, 22, 10, 14);

        expect(
          calculator.calculateWorkHours(
            start,
            end,
            data,
          ),
          const Duration(hours: 19, minutes: 57),
        );
      });
      test('should return correctly within the work week with specialDates',
          () {
        var start = DateTime(2024, 10, 17, 15, 17);
        var end = DateTime(2024, 10, 22, 10, 14);

        expect(
          calculator.calculateWorkHours(
            start,
            end,
            data,
            specialDates: {
              // Change 18 October 2024 to day-off
              DateTime(2024, 10, 18): WorkDayData(workHours: []),
            },
          ),
          const Duration(hours: 11, minutes: 57),
        );
      });
      test('should throw error if start is after end', () {
        var start = DateTime(2000, 1, 1, 10, 45);
        var end = DateTime(2000, 1, 1, 7, 30);
        expect(
          () => calculator.calculateWorkHours(
            start,
            end,
            data,
          ),
          throwsArgumentError,
        );
      });
    });
  });
}
