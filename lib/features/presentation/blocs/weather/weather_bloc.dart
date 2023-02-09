import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_clean_app/features/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_event.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetDayWeatherForecastsUseCase _getDayWeatherForecastsUseCase;
  final GetNextDayWeatherForecastsUseCase _getNextDayWeatherForecastsUseCase;

  WeatherBloc(
    this._getDayWeatherForecastsUseCase,
    this._getNextDayWeatherForecastsUseCase,
  ) : super(WeatherState()) {
    on<WeatherGetDayForecastEvent>(_mapDayForecastEventToState);
    on<WeatherGetNextDaysForecastEvent>(_mapNextDaysForecastEventToState);
  }

  void _mapDayForecastEventToState(
      WeatherGetDayForecastEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    final response =
        await _getDayWeatherForecastsUseCase(event.date, event.location);
    if (response.isSuccess) {
      if (response.data == null) {
        emit(state.copyWith(
          status: WeatherStatus.error,
          error: "Unable to retrieve today's weather forecast",
        ));
        return;
      }
      emit(state.copyWith(
        status: WeatherStatus.success,
        dayWeatherForecasts: response.data,
      ));
    } else {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: response.message,
      ));
    }
  }

  void _mapNextDaysForecastEventToState(
      WeatherGetNextDaysForecastEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(
      status: WeatherStatus.loading,
    ));
    final response =
        await _getNextDayWeatherForecastsUseCase(event.date, event.location);
    if (response.isSuccess) {
      emit(state.copyWith(
        status: WeatherStatus.success,
        nexDayWeatherForecasts: response.data,
      ));
    } else {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: response.message,
      ));
    }
  }
}
