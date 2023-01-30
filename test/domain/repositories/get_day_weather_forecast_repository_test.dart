import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_clean_app/data/datasources/get_day_weather_forecast_datasource.dart';
import 'package:weather_clean_app/data/repositories/get_day_weather_forecast_repository_imp.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/repositories/get_day_weather_forecast_repository.dart';

class GetDayWeatherForecastDataSourceImpMock extends Mock
    implements GetDayWeatherForecastDataSource {}

void main() {
  late GetDayWeatherForecastDataSource getDayWeatherForecastDataSource;
  late GetDayWeatherForecastRepository getDayWeatherForecastRepository;

  setUp(() {
    getDayWeatherForecastDataSource = GetDayWeatherForecastDataSourceImpMock();
    getDayWeatherForecastRepository =
        GetDayWeatherForecastRepositoryImp(getDayWeatherForecastDataSource);
  });

  final location =
      LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

  test('should return a success', () async {
  when(() => getDayWeatherForecastDataSource(any(), location))
      .thenAnswer((_) => Future.value(DefaultResponseEntity(isSuccess: true)));
    final res = await getDayWeatherForecastRepository(DateTime.now(), location);
    expect(res.isSuccess, isTrue);
  });

  test('should return a null data', () async {
  when(() => getDayWeatherForecastDataSource(any(), location))
      .thenAnswer((_) => Future.value(DefaultResponseEntity(isSuccess: true)));
    final res = await getDayWeatherForecastRepository(DateTime.now(), location);
    expect(res.data, isNull);
  });

  test('should return a empty message', () async {
  when(() => getDayWeatherForecastDataSource(any(), location))
      .thenAnswer((_) => Future.value(DefaultResponseEntity(isSuccess: true)));
    final res = await getDayWeatherForecastRepository(DateTime.now(), location);
    expect(res.message, isEmpty);
  });
}
