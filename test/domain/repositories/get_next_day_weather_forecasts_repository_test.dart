import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_clean_app/data/datasources/get_next_day_weather_forecasts_datasource.dart';
import 'package:weather_clean_app/data/repositories/get_next_day_weather_forecasts_repository_imp.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/repositories/get_next_day_weather_forecasts_repository.dart';

class GetNextDayWeatherForecastsDatasourceImpMock extends Mock
    implements GetNextDayWeatherForecastsDatasource {}

void main() {
  late GetNextDayWeatherForecastsDatasource
      getNextDayWeatherForecastsDatasource;
  late GetNextDayWeatherForecastsRepository getNextDayWeatherForecastsUseCase;

  setUp(() {
    getNextDayWeatherForecastsDatasource =
        GetNextDayWeatherForecastsDatasourceImpMock();
    getNextDayWeatherForecastsUseCase = GetNextDayWeatherForecastsRepositoryImp(
        getNextDayWeatherForecastsDatasource);
  });

  final location =
      LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

  test('should return a success', () async {
    when(() => getNextDayWeatherForecastsDatasource(any(), location))
        .thenAnswer(
            (_) => Future.value(DefaultResponseEntity(isSuccess: true, data: [])));
    final res =
        await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.isSuccess, isTrue);
  });

  test('should return a empty data', () async {
    when(() => getNextDayWeatherForecastsDatasource(any(), location))
        .thenAnswer(
            (_) => Future.value(DefaultResponseEntity(isSuccess: true, data: [])));
    final res =
        await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.data, isEmpty);
  });

  test('should return a empty message', () async {
    when(() => getNextDayWeatherForecastsDatasource(any(), location))
        .thenAnswer(
            (_) => Future.value(DefaultResponseEntity(isSuccess: true, data: [])));
    final res =
        await getNextDayWeatherForecastsUseCase(DateTime.now(), location);
    expect(res.message, isEmpty);
  });
}
