import '../enums/forecast.dart';

class WeatherEntity {
  final DateTime day;
  final Forecast forecast;

  WeatherEntity({
    required this.day,
    required this.forecast,
  });
}
