
import '../entities/default_response_entity.dart';
import '../entities/location_entity.dart';
import '../entities/next_day_weather_forecast_entity.dart';

abstract class GetNextDayWeatherForecastsRepository {
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(
      DateTime date, LocationEntity location);
}
