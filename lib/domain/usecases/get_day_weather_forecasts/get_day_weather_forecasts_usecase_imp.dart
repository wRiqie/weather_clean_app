import 'package:weather_clean_app/domain/repositories/get_day_weather_forecast_repository.dart';

import '../../entities/day_weather_forecasts_entity.dart';
import '../../entities/default_response_entity.dart';
import '../../entities/location_entity.dart';
import 'get_day_weather_forecasts_usecase.dart';

class GetDayWeatherForecastsUseCaseImp implements GetDayWeatherForecastsUseCase {
  final GetDayWeatherForecastRepository _getDayWeatherForecastRepository;

  GetDayWeatherForecastsUseCaseImp(this._getDayWeatherForecastRepository);

  @override
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(DateTime date, LocationEntity location) {
    return _getDayWeatherForecastRepository(date, location);
  }
}