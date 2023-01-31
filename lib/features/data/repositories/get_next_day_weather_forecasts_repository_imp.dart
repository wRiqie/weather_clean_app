
import '../../domain/entities/default_response_entity.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/next_day_weather_forecast_entity.dart';
import '../../domain/repositories/get_next_day_weather_forecasts_repository.dart';
import '../datasources/get_next_day_weather_forecasts_datasource.dart';

class GetNextDayWeatherForecastsRepositoryImp implements GetNextDayWeatherForecastsRepository {
  final GetNextDayWeatherForecastsDatasource _getNextDayWeatherForecastsDatasource;

  GetNextDayWeatherForecastsRepositoryImp(this._getNextDayWeatherForecastsDatasource);

  @override
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(DateTime date, LocationEntity location) {
    return _getNextDayWeatherForecastsDatasource(date, location);
  }
}