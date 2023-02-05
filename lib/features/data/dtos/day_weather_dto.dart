import 'dart:convert';

import '../../domain/entities/day_weather_entity.dart';
import '../../domain/enums/forecast.dart';

class DayWeatherDto extends DayWeatherEntity {
  DayWeatherDto({
    required super.temperature,
    required super.hour,
    required super.rainfallChance,
    required super.windsVelocity,
    required super.day,
    required super.forecast,
  });

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'hour': hour,
      'rainfallChance': rainfallChance,
      'windsVelocity': windsVelocity,
      'day': day,
      'forecast': forecast.name,
    };
  }

  factory DayWeatherDto.fromMap(Map<String, dynamic> map) {
    return DayWeatherDto(
      temperature: map['temperature'],
      hour: map['hour'],
      rainfallChance: map['rainfallChance'],
      windsVelocity: map['windsVelocity'],
      day: DateTime.tryParse(map['day'].toString()),
      forecast: Forecast.values
          .firstWhere((e) => e.name == (map['forecast'] ?? 'clean')),
    );
  }

  String toJson() => json.encode(toMap());
}
