
import '../../../domain/entities/next_day_weather_forecast_entity.dart';

abstract class NextDaysForecastState {}

class NextDaysForecastInitialState extends NextDaysForecastState {}

class NextDaysForecastLoadingState extends NextDaysForecastState {}

class NextDaysForecastSuccessState extends NextDaysForecastState {
  final List<NextDayWeatherForecastEntity> forecasts;

  NextDaysForecastSuccessState(this.forecasts);
}

class NextDaysForecastErrorState extends NextDaysForecastState {
  final String? message;

  NextDaysForecastErrorState(this.message);
}