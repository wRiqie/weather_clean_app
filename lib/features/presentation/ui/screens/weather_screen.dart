import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_clean_app/features/presentation/blocs/day_forecast/day_forecast_bloc.dart';
import 'package:weather_clean_app/features/presentation/blocs/next_days_forecast/next_days_forecast_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // final dayWeatherBloc = GetIt.I.get<DayForecastBloc>();
  // final nextDayWeatherBloc = GetIt.I.get<NextDaysForecastBloc>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}