import 'package:weather_clean_app/domain/entities/day_weather_entity.dart';


class DayWeatherForecastsEntity {
  final DateTime day;
  final List<DayWeatherEntity> weathers;

  DayWeatherForecastsEntity({
    required this.day,
    required this.weathers,
  });
}
