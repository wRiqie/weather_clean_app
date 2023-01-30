import 'package:flutter/material.dart';
import 'package:weather_clean_app/data/datasources/get_day_weather_forecast_datasource.dart';
import 'package:weather_clean_app/data/dtos/day_weather_forecasts_dto.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/day_weather_forecasts_entity.dart';

class GetDayWeatherForecastLocalDataSourceImp
    implements GetDayWeatherForecastDataSource {
  final jsonMap = {
    'day': DateTime.now().toUtc().toString(),
    'weathers': [
      {
        'hour': TimeOfDay.now().hour,
        'temperature': 28,
        'rainfallChance': 46,
        'windsVelocity': 20,
        'day': DateTime.now().toUtc().toString(),
        'forecast': 'rain',
      },
      {
        'hour': TimeOfDay.now().hour - 1,
        'temperature': 21,
        'rainfallChance': 50,
        'windsVelocity': 20,
        'day': DateTime.now().toUtc().toString(),
        'forecast': 'rain',
      },
      {
        'hour': TimeOfDay.now().hour - 2,
        'temperature': 31,
        'rainfallChance': 40,
        'windsVelocity': 20,
        'day': DateTime.now().toUtc().toString(),
        'forecast': 'cloudy',
      },
      {
        'hour': TimeOfDay.now().hour - 3,
        'temperature': 27,
        'rainfallChance': 48,
        'windsVelocity': 21,
        'day': DateTime.now().toUtc().toString(),
        'forecast': 'cloudy',
      },
    ],
  };

  @override
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(
      DateTime date, LocationEntity location) {
    return Future.value(
      DefaultResponseEntity(
        isSuccess: true,
        data: DayWeatherForecastsDto.fromMap(jsonMap),
      ),
    );
  }
}
