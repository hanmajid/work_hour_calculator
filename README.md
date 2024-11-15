# work_hour_calculator

[![pub package](https://img.shields.io/pub/v/work_hour_calculator.svg)](https://pub.dev/packages/work_hour_calculator)

Flutter package that calculates how many working hours are spent between two `DateTime`s.

## Installation

Add `work_hour_calculator` dependency to your Flutter project:

```yaml
dependencies:
  work_hour_calculator: ^<latest-version>
```

## Usage

Import the package in your Flutter file, define a `WorkWeekData`, and use `calculateWorkHours` method to calculate work hours between two `DateTime`s:

```dart
import 'package:work_hour_calculator/work_hour_calculator.dart';

void main() {
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
    // Calculate work hours!
    final calculator = WorkHourCalculator();
    var workHours = calculator.calculateWorkHours(
        DateTime(2024, 10, 17, 15, 17),
        DateTime(2024, 10, 22, 10, 14),
        workWeekData,
    );
    // workHours == 19:57:00.000000
}
```

## Issues

For issues, file directly in the [repository](https://github.com/hanmajid/work_hour_calculator/issues).

## Find this library useful? ❤️

Support it by joining __[stargazers](https://github.com/hanmajid/work_hour_calculator/stargazers)__ for this repository. ⭐️ <br>
Also, __[follow me](https://github.com/hanmajid)__ on GitHub for my next project! 🤩

## License

```xml
Copyright 2024 hanmajid (Muhammad Farhan Majid)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```