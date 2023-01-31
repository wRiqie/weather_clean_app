import 'package:flutter_bloc/flutter_bloc.dart';
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
}
