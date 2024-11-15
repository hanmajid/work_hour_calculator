import 'package:flutter_test/flutter_test.dart';
import 'package:work_hour_calculator/work_hour_calculator.dart';

void main() {
  group('WorkWeekData', () {
    test('should construct instance normally', () {
      var workWeekData = WorkWeekData(
        workdays: [
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 9, endHour: 12),
              WorkHourData(startHour: 13, endHour: 18),
            ],
          ),
          WorkDayData(
            workHours: [
              WorkHourData(startHour: 10, endHour: 12),
              WorkHourData(startHour: 13, endHour: 17, endMinute: 30),
            ],
          ),
          WorkDayData(
            workHours: [],
          ),
          WorkDayData(
            workHours: [],
          ),
        ],
      );
      expect(workWeekData.workdays.length, 7);
    });
    test('should throw error if workdays length is not 7', () {
      expect(
        () => WorkWeekData(
          workdays: [
            WorkDayData(
              workHours: [
                WorkHourData(startHour: 9, endHour: 12),
                WorkHourData(startHour: 13, endHour: 18),
              ],
            ),
            WorkDayData(
              workHours: [
                WorkHourData(startHour: 9, endHour: 12),
                WorkHourData(startHour: 13, endHour: 18),
              ],
            ),
            WorkDayData(
              workHours: [
                WorkHourData(startHour: 9, endHour: 12),
                WorkHourData(startHour: 13, endHour: 18),
              ],
            ),
            WorkDayData(
              workHours: [
                WorkHourData(startHour: 9, endHour: 12),
                WorkHourData(startHour: 13, endHour: 18),
              ],
            ),
            WorkDayData(
              workHours: [
                WorkHourData(startHour: 10, endHour: 12),
                WorkHourData(startHour: 13, endHour: 17, endMinute: 30),
              ],
            ),
            WorkDayData(
              workHours: [],
            ),
          ],
        ),
        throwsAssertionError,
      );
    });
  });
}
