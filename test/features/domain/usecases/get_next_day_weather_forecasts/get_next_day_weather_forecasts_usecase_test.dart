import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_app/features/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/features/domain/entities/location_entity.dart';
import 'package:weather_clean_app/features/domain/entities/next_day_weather_forecast_entity.dart';
import 'package:weather_clean_app/features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';

class GetNextDayWeatherForecastsUseCaseImpMock implements GetNextDayWeatherForecastsUseCase {
  @override
  Future<DefaultResponseEntity<List<NextDayWeatherForecastEntity>>> call(DateTime day, LocationEntity location) {
    return Future.value(DefaultResponseEntity(isSuccess: true, data: []));
  }
}

void main() {
  late GetNextDayWeatherForecastsUseCase getNextDayWeatherForecastsUseCase;

  setUp(() {
    getNextDayWeatherForecastsUseCase = GetNextDayWeatherForecastsUseCaseImpMock();
  });

  final location =
      LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

  test('should return a success', () async {
    final res = await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.isSuccess, isTrue);
  });

  test('should return a empty data', () async {
    final res = await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.data, []);
  });
  
  test('should return a empty message', () async {
    final res = await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.message, isEmpty);
  });
}