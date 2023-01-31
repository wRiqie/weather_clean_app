
import '../../domain/entities/default_response_entity.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/next_day_weather_forecast_entity.dart';

abstract class GetNextDayWeatherForecastsDatasource {
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(DateTime date, LocationEntity location);
}