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

  group('[getDayForecastEvent]', () {
    final location =
        LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

    blocTest<WeatherBloc, WeatherState>(
      'should emit DayForecastLoadingState - DayForecastSuccessState when isSuccess is true and has data',
      build: () => weatherBloc,
      act: (bloc) {
        when(() => getDayWeatherForecastsUseCase(any(), location)).thenAnswer(
            (_) => Future.value(DefaultResponseEntity(
                isSuccess: true,
                data: DayWeatherForecastsEntity(
                    day: DateTime.now(), weathers: []))));
        bloc.add(WeatherGetDayForecastEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<WeatherState>()
            .having((e) => e.status.isLoading, 'isLoading', isTrue),
        isA<WeatherState>()
            .having((e) => e.status.isSuccess, 'isSuccess', isTrue),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'should emit DayForecastLoadingState - DayForecastErrorState when isSuccess is true but no has data',
      build: () => weatherBloc,
      act: (bloc) {
        when(() => getDayWeatherForecastsUseCase(any(), location))
            .thenAnswer((_) => Future.value(DefaultResponseEntity(
                  isSuccess: true,
                )));
        bloc.add(WeatherGetDayForecastEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<WeatherState>()
            .having((e) => e.status.isLoading, 'isLoading', isTrue),
        isA<WeatherState>()
            .having((e) => e.status.isError, 'isError', isTrue)
            .having((e) => e.error?.isNotEmpty, 'isNotEmpty', isTrue),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'should emit DayForecastLoadingState - DayForecastErrorState when isSuccess is false',
      build: () => weatherBloc,
      act: (bloc) {
        when(() => getDayWeatherForecastsUseCase(any(), location)).thenAnswer(
            (_) => Future.value(
                DefaultResponseEntity(isSuccess: false, message: 'error')));
        bloc.add(WeatherGetDayForecastEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<WeatherState>()
            .having((e) => e.status.isLoading, 'isLoading', isTrue),
        isA<WeatherState>()
            .having((e) => e.status.isError, 'isError', isTrue)
            .having((e) => e.error?.isNotEmpty, 'isNotEmpty', isTrue),
      ],
    );
  });

  group('[getNextDaysForecastEvent]', () {
    final location =
        LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

    blocTest<WeatherBloc, WeatherState>(
      'should return LoadingState - SuccessState when isSuccess is true',
      build: () => weatherBloc,
      act: (bloc) {
        when(() => getNextDayWeatherForecastsUsecase(any(), location))
            .thenAnswer(
          (_) => Future.value(
            DefaultResponseEntity(isSuccess: true),
          ),
        );
        bloc.add(WeatherGetNextDaysForecastEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<WeatherState>()
            .having((e) => e.status.isLoading, 'isLoading', isTrue),
        isA<WeatherState>()
            .having((e) => e.status.isSuccess, 'isSuccess', isTrue),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'should return LoadingState - ErrorState when isSuccess is false',
      build: () => weatherBloc,
      act: (bloc) {
        when(() => getNextDayWeatherForecastsUsecase(any(), location))
            .thenAnswer(
          (_) => Future.value(
            DefaultResponseEntity(isSuccess: false, message: 'error'),
          ),
        );
        bloc.add(WeatherGetNextDaysForecastEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<WeatherState>()
            .having((e) => e.status.isLoading, 'isLoading', isTrue),
        isA<WeatherState>()
            .having((e) => e.status.isError, 'isError', isTrue)
            .having((e) => e.error?.isNotEmpty, 'isNotEmpty', isTrue),
      ],
    );
  });
}
