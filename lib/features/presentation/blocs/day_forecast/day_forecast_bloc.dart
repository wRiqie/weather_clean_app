import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_app/features/presentation/blocs/next_days_forecast/next_days_forecast_bloc.dart';
import 'package:weather_clean_app/features/presentation/blocs/next_days_forecast/next_days_forecast_state.dart';

import '../../../domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import 'day_forecast_event.dart';
import 'day_forecast_state.dart';

class DayForecastBloc extends Bloc<DayForecastEvent, DayForecastState> {
  final NextDaysForecastBloc _nextDaysForecastBloc;
  late final StreamSubscription _nextDaysForecastBlocSubscription;

  final GetDayWeatherForecastsUseCase _getDayWeatherForecastsUseCase;

  DayForecastBloc(
    this._getDayWeatherForecastsUseCase,
    this._nextDaysForecastBloc,
  ) : super(DayForecastInitialState()) {
    _nextDaysForecastBlocSubscription =
        _nextDaysForecastBloc.stream.listen((state) {
          if(state is NextDaysForecastSuccessState) {
            
          }
        });

    on<DayForecastLoadEvent>((event, emit) async {
      emit(DayForecastLoadingState());
      final state = await _loadDayForecasts(event);
      emit(state);
    });
  }

  Future<DayForecastState> _loadDayForecasts(DayForecastLoadEvent event) async {
    final res =
        await _getDayWeatherForecastsUseCase(event.date, event.location);
    if (res.isSuccess) {
      if (res.data == null) {
        return DayForecastErrorState(
            "Unable to retrieve today's weather forecast");
      }
      return DayForecastSuccessState(res.data!);
    } else {
      return DayForecastErrorState(res.message);
    }
  }

  @override
  Future<void> close() {
    _nextDaysForecastBlocSubscription.cancel();
    return super.close();
  }
}
