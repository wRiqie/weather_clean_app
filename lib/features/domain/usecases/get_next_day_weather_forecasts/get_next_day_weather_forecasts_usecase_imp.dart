
import '../../entities/default_response_entity.dart';
import '../../entities/location_entity.dart';
import '../../entities/next_day_weather_forecast_entity.dart';
import '../../repositories/get_next_day_weather_forecasts_repository.dart';
import 'get_next_day_weather_forecasts_usecase.dart';

class GetNextDayWeatherForecastsUseCaseImp
    implements GetNextDayWeatherForecastsUseCase {
  final GetNextDayWeatherForecastsRepository
      _getNextDayWeatherForecastsRepository;

  GetNextDayWeatherForecastsUseCaseImp(
      this._getNextDayWeatherForecastsRepository);

  @override
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(
      DateTime day, LocationEntity location) {
    return _getNextDayWeatherForecastsRepository(day, location);
  }
}
