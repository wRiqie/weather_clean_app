import 'package:weather_clean_app/domain/entities/day_weather_forecasts_entity.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';

abstract class GetDayWeatherForecastsUseCase {
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(DateTime date, LocationEntity location);
}