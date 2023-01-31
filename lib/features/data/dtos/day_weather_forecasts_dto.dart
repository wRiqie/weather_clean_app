import 'dart:convert';

import '../../domain/entities/day_weather_forecasts_entity.dart';
import 'day_weather_dto.dart';


class DayWeatherForecastsDto extends DayWeatherForecastsEntity {
  final List<DayWeatherDto> weathersD;
  DayWeatherForecastsDto({required super.day, required this.weathersD}) : super(weathers: weathersD);

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'weathers': weathersD.map((e) => e.toMap()).toList(),
    };
  }

  factory DayWeatherForecastsDto.fromMap(Map<String, dynamic> map) {
    return DayWeatherForecastsDto(
      day: DateTime.parse(map['day']),
      weathersD: (map['weathers'] as List<Map<String, dynamic>>)
          .map((e) => DayWeatherDto.fromMap(e))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DayWeatherForecastsDto.fromJson(String source) =>
      DayWeatherForecastsDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
