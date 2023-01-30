import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/day_weather_forecasts_entity.dart';
import 'package:weather_clean_app/domain/repositories/get_day_weather_forecast_repository.dart';

class GetDayWeatherForecastRepositoryImpMock implements GetDayWeatherForecastRepository {
  @override
  Future<DefaultResponseEntity<DayWeatherForecastsEntity>> call(DateTime date, LocationEntity location) {
    return Future.value(DefaultResponseEntity(isSuccess: true));
  }
}

void main() {
  late GetDayWeatherForecastRepository getDayWeatherForecastRepository;

  setUp(() {
    getDayWeatherForecastRepository = GetDayWeatherForecastRepositoryImpMock();
  });

  final location =
      LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

  test('should return a success', () async {
    final res = await getDayWeatherForecastRepository(DateTime.now(), location);
    expect(res.isSuccess, isTrue);
  });

  test('should return a null data', () async {
    final res = await getDayWeatherForecastRepository(DateTime.now(), location);
    expect(res.data, isNull);
  });
  
  test('should return a empty message', () async {
    final res = await getDayWeatherForecastRepository(DateTime.now(), location);
    expect(res.message, isEmpty);
  });
}