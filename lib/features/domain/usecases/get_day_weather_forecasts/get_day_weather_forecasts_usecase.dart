
import '../../entities/day_weather_forecasts_entity.dart';
import '../../entities/default_response_entity.dart';
import '../../entities/location_entity.dart';

abstract class GetDayWeatherForecastsUseCase {
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(DateTime date, LocationEntity location);
}