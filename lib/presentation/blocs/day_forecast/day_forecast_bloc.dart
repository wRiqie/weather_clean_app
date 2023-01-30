// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:weather_clean_app/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/presentation/blocs/day_forecast/day_forecast_event.dart';
import 'package:weather_clean_app/presentation/blocs/day_forecast/day_forecast_state.dart';

class DayForecastBloc extends Bloc<DayForecastEvent, DayForecastState> {
  final GetDayWeatherForecastsUseCase _getDayWeatherForecastsUseCase;

  DayForecastBloc(
    this._getDayWeatherForecastsUseCase,
  ) : super(DayForecastInitialState()) {
    on<DayForecastLoadEvent>((event, emit) async {
      emit(DayForecastLoadingState());
      final state = await _loadDayForecasts(event);
      emit(state);
    });
  }

  Future<DayForecastState> _loadDayForecasts(DayForecastLoadEvent event) async {
    final res = await _getDayWeatherForecastsUseCase(event.date, event.location);
    if(res.isSuccess) {
      return DayForecastSuccessState(res.data!);
    } else {
      return DayForecastErrorState(res.message);
    }
  }
}
