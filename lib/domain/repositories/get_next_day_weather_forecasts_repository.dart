import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/entities/next_day_weather_forecast_entity.dart';

abstract class GetNextDayWeatherForecastsRepository {
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(
      DateTime date, LocationEntity location);
}
