import 'dart:math' as math;

import 'package:weather_clean_app/features/domain/entities/weather_entity.dart';

class DayWeatherEntity extends WeatherEntity {
  final int temperature;
  final int hour;
  final double rainfallChance;
  final int windsVelocity;

  DayWeatherEntity({
    required this.hour,
    required this.temperature,
    required super.day,
    required super.forecast,
    required this.rainfallChance,
    required this.windsVelocity,
  });
}

extension DayWeatherListExt on List<DayWeatherEntity> {
  List<int> get temps => map((e) => e.temperature).toList();

  int get min => temps.reduce(math.min);

  int get max => temps.reduce(math.max);
}
