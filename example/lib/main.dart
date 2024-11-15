import 'package:flutter/material.dart';
import 'package:work_hour_calculator/work_hour_calculator.dart';

void main() {
  runApp(const MainApp());
}

// Define work hours for 1 week.
var workWeekData = WorkWeekData(
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = WorkHourCalculator();
    var start = DateTime(2024, 10, 17, 15, 17);
    var end = DateTime(2024, 10, 22, 10, 14);
    var workHours = calculator.calculateWorkHours(
      start,
      end,
      workWeekData,
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('work_hour_calculator Example'),
        ),
        body: Column(
          children: [
            Text('Start: $start'),
            Text('End: $end'),
            Text('Work Hours: $workHours'),
          ],
        ),
      ),
    );
  }
}
