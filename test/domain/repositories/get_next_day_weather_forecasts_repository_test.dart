import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_app/domain/entities/next_day_weather_forecast_entity.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/repositories/get_next_day_weather_forecasts_repository.dart';

class GetNextDayWeatherForecastsRepositoryImpMock implements GetNextDayWeatherForecastsRepository {
  @override
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(DateTime date, LocationEntity location) {
    return Future.value(DefaultResponseEntity(isSuccess: true, data: []));
  }
}

void main() {
  late GetNextDayWeatherForecastsRepository getNextDayWeatherForecastsUseCase;

  setUp(() {
    getNextDayWeatherForecastsUseCase = GetNextDayWeatherForecastsRepositoryImpMock();
  });

  final location =
      LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

  test('should return a success', () async {
    final res = await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.isSuccess, isTrue);
  });

  test('should return a empty data', () async {
    final res = await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.data, isEmpty);
  });
  
  test('should return a empty message', () async {
    final res = await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.message, isEmpty);
  });
}