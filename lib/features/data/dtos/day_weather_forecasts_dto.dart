import '../../domain/entities/day_weather_forecasts_entity.dart';
import 'day_weather_dto.dart';


class DayWeatherForecastsDto extends DayWeatherForecastsEntity {
  DayWeatherForecastsDto({required super.day, required super.weathers});

  factory DayWeatherForecastsDto.fromMap(Map<String, dynamic> map) {
    return DayWeatherForecastsDto(
      day: DateTime.parse(map['day']),
      weathers: (map['weathers'] as List<Map<String, dynamic>>)
          .map((e) => DayWeatherDto.fromMap(e))
          .toList(),
    );
  }
}
