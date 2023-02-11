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
    on<WeatherLoadForecastEvent>(_mapLoadForecastEventToState);
  }

  void _mapLoadForecastEventToState(
      WeatherLoadForecastEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    final dayResponse =
        await _getDayWeatherForecastsUseCase(event.date, event.location);
    final nextDaysResponse =
        await _getNextDayWeatherForecastsUseCase(event.date, event.location);
    if (dayResponse.isSuccess && nextDaysResponse.isSuccess) {
      emit(state.copyWith(
        status: WeatherStatus.success,
        dayWeatherForecasts: dayResponse.data,
        nexDayWeatherForecasts: nextDaysResponse.data,
      ));
    } else {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: dayResponse.message ?? nextDaysResponse.message,
      ));
    }
  }
}
