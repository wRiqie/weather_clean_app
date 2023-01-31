import 'package:weather_clean_app/core/extensions.dart';

enum Forecast { clean, rain, cloudy, storm }

extension ForecastExt on Forecast {
  static final List<Map<String, dynamic>> _forecasts = [
    {
      'id': 1,
      'forecast': Forecast.clean,
    },
    {
      'id': 2,
      'forecast': Forecast.rain,
    },
    {
      'id': 3,
      'forecast': Forecast.cloudy,
    },
    {
      'id': 4,
      'forecast': Forecast.storm,
    },
  ];

  static Forecast getByName(String name) =>
      _forecasts.firstWhereOrNull((e) => e['forecast'].name == name)?['forecast'] ?? Forecast.clean;
}
