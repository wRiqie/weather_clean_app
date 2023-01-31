import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_clean_app/domain/entities/day_weather_forecasts_entity.dart';
import 'package:weather_clean_app/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/domain/entities/location_entity.dart';
import 'package:weather_clean_app/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import 'package:weather_clean_app/presentation/blocs/day_forecast/day_forecast_bloc.dart';
import 'package:weather_clean_app/presentation/blocs/day_forecast/day_forecast_event.dart';
import 'package:weather_clean_app/presentation/blocs/day_forecast/day_forecast_state.dart';

class GetDayWeatherForecastsUseCaseImpMock extends Mock
    implements GetDayWeatherForecastsUseCase {}

void main() {
  late GetDayWeatherForecastsUseCase getDayWeatherForecastsUseCase;
  late DayForecastBloc bloc;

  setUp(() {
    getDayWeatherForecastsUseCase = GetDayWeatherForecastsUseCaseImpMock();
    bloc = DayForecastBloc(getDayWeatherForecastsUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  test('should initial state idle', () {
    expect(bloc.state, isA<DayForecastInitialState>());
  });

  group('[GetDayWeatherForecasts]', () {
    final location =
        LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

    blocTest<DayForecastBloc, DayForecastState>(
      'should emit DayForecastLoadingState - DayForecastSuccessState when isSuccess is true and has data',
      build: () => bloc,
      act: (bloc) {
        when(() => getDayWeatherForecastsUseCase(any(), location)).thenAnswer(
            (_) => Future.value(DefaultResponseEntity(
                isSuccess: true,
                data: DayWeatherForecastsEntity(
                    day: DateTime.now(), weathers: []))));
        bloc.add(DayForecastLoadEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<DayForecastLoadingState>(),
        isA<DayForecastSuccessState>(),
      ],
    );

    blocTest<DayForecastBloc, DayForecastState>(
      'should emit DayForecastLoadingState - DayForecastErrorState when isSuccess is true but no has data',
      build: () => bloc,
      act: (bloc) {
        when(() => getDayWeatherForecastsUseCase(any(), location))
            .thenAnswer((_) => Future.value(DefaultResponseEntity(
                  isSuccess: true,
                )));
        bloc.add(DayForecastLoadEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<DayForecastLoadingState>(),
        isA<DayForecastErrorState>()
            .having((e) => e.message, 'IsNotEmpty', isNotEmpty),
      ],
    );

    blocTest<DayForecastBloc, DayForecastState>(
      'should emit DayForecastLoadingState - DayForecastErrorState when isSuccess is false',
      build: () => bloc,
      act: (bloc) {
        when(() => getDayWeatherForecastsUseCase(any(), location))
            .thenAnswer((_) => Future.value(DefaultResponseEntity(
                  isSuccess: false,
                  message: 'error'
                )));
        bloc.add(DayForecastLoadEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<DayForecastLoadingState>(),
        isA<DayForecastErrorState>()
            .having((e) => e.message, 'IsNotEmpty', equals('error')),
      ],
    );
  });
}
