import 'package:weather_clean_app/domain/entities/weather_entity.dart';

class NextDayWeatherForecastEntity extends WeatherEntity {
  final int minTemp;
  final int maxTemp;

  NextDayWeatherForecastEntity({
    required this.minTemp,
    required this.maxTemp,
    required super.day,
    required super.forecast,
  });

  int get dayOfWeek => day.weekday;
}
