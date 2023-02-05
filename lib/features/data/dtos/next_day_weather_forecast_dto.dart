import 'dart:convert';

import '../../domain/entities/next_day_weather_forecast_entity.dart';
import '../../domain/enums/forecast.dart';

class NextDayWeatherForecastDto extends NextDayWeatherForecastEntity {
  NextDayWeatherForecastDto({
    required super.maxTemp,
    required super.minTemp,
    required super.day,
    required super.forecast,
  });

  Map<String, dynamic> toMap() {
    return {
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'day': day,
      'forecast': forecast.name,
    };
  }

  factory NextDayWeatherForecastDto.fromMap(Map<String, dynamic> map) {
    return NextDayWeatherForecastDto(
      maxTemp: map['maxTemp'],
      minTemp: map['minTemp'],
      day: map['day'],
      forecast: Forecast.values
          .firstWhere((e) => e.name == (map['forecast'] ?? 'clean')),
    );
  }

  String toJson() => json.encode(toMap());

  factory NextDayWeatherForecastDto.fromJson(String source) =>
      NextDayWeatherForecastDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
