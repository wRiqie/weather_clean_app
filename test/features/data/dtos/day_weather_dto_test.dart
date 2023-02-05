import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_app/features/data/dtos/day_weather_dto.dart';

void main() {
  group('[DayWeatherDto]', () {
    test('FromMap', () {
      const day = '2019-03-28 10:06:27.090Z';
      final map = {
        'temperature': 0,
        'hour': 15,
        'rainfallChance': 1.0,
        'windsVelocity': 1,
        'day': day,
        'forecast': 'clean',
      };
      
      final res = DayWeatherDto.fromMap(map);

      expect(res.day.toString(), equals(day));
    });
  });
}