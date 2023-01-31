import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_app/features/domain/entities/day_weather_entity.dart';
import 'package:weather_clean_app/features/domain/enums/forecast.dart';

void main() {
  List<DayWeatherEntity> entities = [
    DayWeatherEntity(
      hour: 0,
      temperature: 1,
      day: DateTime.now(),
      forecast: Forecast.clean,
      rainfallChance: 0,
      windsVelocity: 0,
    ),
    DayWeatherEntity(
      hour: 0,
      temperature: 2,
      day: DateTime.now(),
      forecast: Forecast.clean,
      rainfallChance: 0,
      windsVelocity: 0,
    ),
    DayWeatherEntity(
      hour: 0,
      temperature: 3,
      day: DateTime.now(),
      forecast: Forecast.clean,
      rainfallChance: 0,
      windsVelocity: 0,
    ),
  ];

  test('should return minTemp 1', () {
    expect(entities.min, 1);
  });

  test('should return maxTemp 3', () {
    expect(entities.max, 3);
  });
}
