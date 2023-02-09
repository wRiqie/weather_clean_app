import '../../../domain/entities/default_response_entity.dart';
import '../../../domain/entities/location_entity.dart';
import '../../../domain/entities/next_day_weather_forecast_entity.dart';
import '../../dtos/next_day_weather_forecast_dto.dart';
import '../get_next_day_weather_forecasts_datasource.dart';

class GetNextDayWeatherForecastsLocalDatasourceImp
    implements GetNextDayWeatherForecastsDatasource {
  final jsonMap = [
    {
      'maxTemp': 30,
      'minTemp': 20,
      'day': DateTime.now().add(const Duration(days: 1)),
      'forecast': 'cloudy',
    },
    {
      'maxTemp': 35,
      'minTemp': 17,
      'day': DateTime.now().add(const Duration(days: 2)),
      'forecast': 'rain',
    },
    {
      'maxTemp': 15,
      'minTemp': 8,
      'day': DateTime.now().add(const Duration(days: 3)),
      'forecast': 'storm',
    },
  ];

  @override
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(
      DateTime date, LocationEntity location) {
    return Future.delayed(
      const Duration(seconds: 3),
      () => DefaultResponseEntity(
          isSuccess: true,
          data: jsonMap
              .map((e) => NextDayWeatherForecastDto.fromMap(e))
              .toList()),
    );
  }
}
