import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_app/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/presentation/blocs/next_days_forecast/next_days_forecast_event.dart';
import 'package:weather_clean_app/presentation/blocs/next_days_forecast/next_days_forecast_state.dart';

class NextDaysForecastBloc
    extends Bloc<NextDaysForecastEvent, NextDaysForecastState> {
  final GetNextDayWeatherForecastsUseCase _getNextDayWeatherForecastsUseCase;

  NextDaysForecastBloc(this._getNextDayWeatherForecastsUseCase)
      : super(NextDaysForecastInitialState()) {
    on<NextDaysForecastLoadEvent>((event, emit) async {
      emit(NextDaysForecastLoadingState());
      final state = await _loadNextDaysForecast(event);
      emit(state);
    });
  }

  Future<NextDaysForecastState> _loadNextDaysForecast(
      NextDaysForecastLoadEvent event) async {
    final res = await _getNextDayWeatherForecastsUseCase(
        event.date, event.location);
    if (res.isSuccess) {
      return NextDaysForecastSuccessState(res.data ?? []);
    } else {
      return NextDaysForecastErrorState(res.message);
    }
  }
}
