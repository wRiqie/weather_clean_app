
import '../../domain/entities/day_weather_forecasts_entity.dart';
import '../../domain/entities/default_response_entity.dart';
import '../../domain/entities/location_entity.dart';

abstract class GetDayWeatherForecastDataSource {
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(DateTime date, LocationEntity location);
}