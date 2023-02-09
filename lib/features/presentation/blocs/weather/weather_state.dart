import 'package:weather_clean_app/features/domain/entities/day_weather_forecasts_entity.dart';
import 'package:weather_clean_app/features/domain/entities/next_day_weather_forecast_entity.dart';

enum WeatherStatus { idle, loading, success, error }

extension WeatherStatusExt on WeatherStatus {
  bool get isIdle => this == WeatherStatus.idle; 
  bool get isLoading => this == WeatherStatus.loading; 
  bool get isSuccess => this == WeatherStatus.success; 
  bool get isError => this == WeatherStatus.error; 
}

class WeatherState {
  final WeatherStatus status;
  final DayWeatherForecastsEntity? dayWeatherForecasts;
  final List<NextDayWeatherForecastEntity> nexDayWeatherForecasts;
  final String? error;

  WeatherState({
    this.status = WeatherStatus.idle,
    this.dayWeatherForecasts,
    this.nexDayWeatherForecasts = const [],
    this.error,
  });

  WeatherState copyWith({
    WeatherStatus? status,
    DayWeatherForecastsEntity? dayWeatherForecasts,
    List<NextDayWeatherForecastEntity>? nexDayWeatherForecasts,
    String? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      dayWeatherForecasts: dayWeatherForecasts ?? this.dayWeatherForecasts,
      nexDayWeatherForecasts: nexDayWeatherForecasts ?? this.nexDayWeatherForecasts,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'WeatherState(status: $status, dayWeatherForecasts: $dayWeatherForecasts, nexDayWeatherForecasts: $nexDayWeatherForecasts, error: $error)';
  }
}
