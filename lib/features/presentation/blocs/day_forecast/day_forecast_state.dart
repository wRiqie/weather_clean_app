
import '../../../domain/entities/day_weather_forecasts_entity.dart';

abstract class DayForecastState {}

class DayForecastInitialState extends DayForecastState {}

class DayForecastLoadingState extends DayForecastState {}

class DayForecastSuccessState extends DayForecastState {
  final DayWeatherForecastsEntity dayWeatherForecasts;

  DayForecastSuccessState(this.dayWeatherForecasts);
}

class DayForecastErrorState extends DayForecastState {
  final String? message;

  DayForecastErrorState(this.message);
}