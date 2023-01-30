import 'package:weather_clean_app/domain/repositories/get_next_day_weather_forecasts_repository.dart';

import '../../entities/default_response_entity.dart';
import '../../entities/location_entity.dart';
import '../../entities/next_day_weather_forecast_entity.dart';
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
