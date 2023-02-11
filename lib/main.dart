import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_clean_app/core/inject.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_clean_app/features/presentation/ui/screens/weather_screen.dart';

import 'features/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import 'features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather clean app',
      theme: ThemeData.light(),
      home: BlocProvider(
        create: (context) => WeatherBloc(
          GetIt.I<GetDayWeatherForecastsUseCase>(),
          GetIt.I<GetNextDayWeatherForecastsUseCase>(),
        ),
        child: const WeatherScreen(),
      ),
    );
  }
}
