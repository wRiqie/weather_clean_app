import 'package:weather_clean_app/data/datasources/get_day_weather_forecast_datasource.dart';
import 'package:weather_clean_app/data/dtos/day_weather_forecasts_dto.dart';

import '../../domain/entities/day_weather_forecasts_entity.dart';
import '../../domain/entities/default_response_entity.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/repositories/get_day_weather_forecast_repository.dart';

class GetDayWeatherForecastRepositoryImp
    implements GetDayWeatherForecastRepository {
  final GetDayWeatherForecastDataSource _getDayWeatherForecastDataSource;

  GetDayWeatherForecastRepositoryImp(this._getDayWeatherForecastDataSource);

  @override
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(
      DateTime date, LocationEntity location) async {
    return _getDayWeatherForecastDataSource(date, location);
  }
}
