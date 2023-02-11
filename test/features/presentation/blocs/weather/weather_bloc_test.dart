import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_clean_app/features/domain/entities/day_weather_forecasts_entity.dart';
import 'package:weather_clean_app/features/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/features/domain/entities/location_entity.dart';
import 'package:weather_clean_app/features/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_event.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_state.dart';

class GetDayWeatherForecastsUseCaseImpMock extends Mock
    implements GetDayWeatherForecastsUseCase {}

class GetNextDayWeatherForecastsUsecaseImpMock extends Mock
    implements GetNextDayWeatherForecastsUseCase {}

void main() {
  late GetDayWeatherForecastsUseCase getDayWeatherForecastsUseCase;
  late GetNextDayWeatherForecastsUseCase getNextDayWeatherForecastsUsecase;

  late WeatherBloc weatherBloc;

  setUp(() {
    getDayWeatherForecastsUseCase = GetDayWeatherForecastsUseCaseImpMock();
    getNextDayWeatherForecastsUsecase =
        GetNextDayWeatherForecastsUsecaseImpMock();

    weatherBloc = WeatherBloc(
        getDayWeatherForecastsUseCase, getNextDayWeatherForecastsUsecase);
  });

  tearDown(() {
    weatherBloc.close();
  });

  test('should initial state idle', () {
    expect(weatherBloc.state.status, equals(WeatherStatus.idle));
  });

  final location =
      LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

  blocTest(
    'should emit loadingStatus - successStatus when all data were loaded',
    build: () => weatherBloc,
    act: (bloc) {
      when(() => getDayWeatherForecastsUseCase(any(), location)).thenAnswer(
        (_) => Future.value(
          DefaultResponseEntity(
            isSuccess: true,
            data: DayWeatherForecastsEntity(day: DateTime.now(), weathers: []),
          ),
        ),
      );
      when(() => getNextDayWeatherForecastsUsecase(any(), location)).thenAnswer(
        (_) => Future.value(
          DefaultResponseEntity(isSuccess: true),
        ),
      );
      bloc.add(WeatherLoadForecastEvent(DateTime.now(), location));
    },
    expect: () => [
      isA<WeatherState>()
          .having((e) => e.status.isLoading, 'isLoading', isTrue),
      isA<WeatherState>()
          .having((e) => e.status.isSuccess, 'isSuccess', isTrue)
          .having((e) => e.dayWeatherForecasts, 'isNotNull', isNotNull)
          .having((e) => e.nexDayWeatherForecasts, 'isNotNull', isNotNull)
    ],
  );

  blocTest(
    'should emit loadingStatus - ErrorStatus when isSuccess of dayForecast is false',
    build: () => weatherBloc,
    act: (bloc) {
      when(() => getDayWeatherForecastsUseCase(any(), location)).thenAnswer(
          (_) => Future.value(
              DefaultResponseEntity(isSuccess: false, message: 'error')));
      when(() => getNextDayWeatherForecastsUsecase(any(), location)).thenAnswer(
        (_) => Future.value(
          DefaultResponseEntity(isSuccess: true),
        ),
      );
      bloc.add(WeatherLoadForecastEvent(DateTime.now(), location));
    },
    expect: () => [
      isA<WeatherState>()
          .having((e) => e.status.isLoading, 'isLoading', isTrue),
      isA<WeatherState>()
          .having((e) => e.status.isError, 'isError', isTrue)
          .having((e) => e.error, 'error', equals('error'))
    ],
  );

  blocTest(
    'should emit loadingStatus - ErrorStatus when isSuccess of nextDaysForecast is false',
    build: () => weatherBloc,
    act: (bloc) {
      when(() => getDayWeatherForecastsUseCase(any(), location)).thenAnswer(
          (_) => Future.value(
              DefaultResponseEntity(isSuccess: true)));
      when(() => getNextDayWeatherForecastsUsecase(any(), location)).thenAnswer(
        (_) => Future.value(
          DefaultResponseEntity(isSuccess: false, message: 'error'),
        ),
      );
      bloc.add(WeatherLoadForecastEvent(DateTime.now(), location));
    },
    expect: () => [
      isA<WeatherState>()
          .having((e) => e.status.isLoading, 'isLoading', isTrue),
      isA<WeatherState>()
          .having((e) => e.status.isError, 'isError', isTrue)
          .having((e) => e.error, 'error', equals('error'))
    ],
  );
}
