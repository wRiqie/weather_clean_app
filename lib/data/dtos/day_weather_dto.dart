import 'dart:convert';


import 'package:weather_clean_app/domain/entities/day_weather_entity.dart';

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
      'day': day.millisecondsSinceEpoch,
      'forecast': forecast,
    };
  }

  factory DayWeatherDto.fromMap(Map<String, dynamic> map) {
    return DayWeatherDto(
      temperature: map['temperature'],
      hour: map['hour'],
      rainfallChance: map['rainfallChance'],
      windsVelocity: map['windsVelocity'],
      day: DateTime.fromMillisecondsSinceEpoch(map['day']),
      forecast: map['forecast'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DayWeatherDto.fromJson(String source) => DayWeatherDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
