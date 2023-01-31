import 'day_weather_entity.dart';

class DayWeatherForecastsEntity {
  final DateTime day;
  final List<DayWeatherEntity> weathers;

  DayWeatherForecastsEntity({
    required this.day,
    required this.weathers,
  });
}
