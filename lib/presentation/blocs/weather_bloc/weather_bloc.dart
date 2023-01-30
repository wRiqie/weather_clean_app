import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_app/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_clean_app/presentation/blocs/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(super.initialState);
}