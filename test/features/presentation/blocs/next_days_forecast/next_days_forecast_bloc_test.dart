import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_clean_app/features/presentation/blocs/next_days_forecast/next_days_forecast_bloc.dart';
import 'package:weather_clean_app/features/presentation/blocs/next_days_forecast/next_days_forecast_event.dart';
import 'package:weather_clean_app/features/presentation/blocs/next_days_forecast/next_days_forecast_state.dart';
import 'package:weather_clean_app/features/domain/entities/default_response_entity.dart';
import 'package:weather_clean_app/features/domain/entities/location_entity.dart';
import 'package:weather_clean_app/features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';

class GetNextDayWeatherForecastsUsecaseImpMock extends Mock
    implements GetNextDayWeatherForecastsUseCase {}

void main() {
  late GetNextDayWeatherForecastsUseCase getNextDayWeatherForecastsUsecase;
  late NextDaysForecastBloc bloc;

  setUp(() {
    getNextDayWeatherForecastsUsecase =
        GetNextDayWeatherForecastsUsecaseImpMock();
    bloc = NextDaysForecastBloc(getNextDayWeatherForecastsUsecase);
  });

  tearDown(() {
    bloc.close();
  });

  test('should initial state idle', () {
    expect(bloc.state, isA<NextDaysForecastInitialState>());
  });

  group('[GetNextDayWeatherForecasts]', () {
    final location =
        LocationEntity(city: '', uf: '', country: '', lat: 0, long: 0);

    blocTest<NextDaysForecastBloc, NextDaysForecastState>(
      'should return LoadingState - SuccessState when isSuccess is true',
      build: () => bloc,
      act: (bloc) {
        when(() => getNextDayWeatherForecastsUsecase(any(), location))
            .thenAnswer(
          (_) => Future.value(
            DefaultResponseEntity(isSuccess: true),
          ),
        );
        bloc.add(NextDaysForecastLoadEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<NextDaysForecastLoadingState>(),
        isA<NextDaysForecastSuccessState>()
            .having((e) => e.forecasts, 'isEmpty', isEmpty),
      ],
    );

    blocTest<NextDaysForecastBloc, NextDaysForecastState>(
      'should return LoadingState - ErrorState when isSuccess is false',
      build: () => bloc,
      act: (bloc) {
        when(() => getNextDayWeatherForecastsUsecase(any(), location))
            .thenAnswer(
          (_) => Future.value(
            DefaultResponseEntity(isSuccess: false, message: 'error'),
          ),
        );
        bloc.add(NextDaysForecastLoadEvent(DateTime.now(), location));
      },
      expect: () => [
        isA<NextDaysForecastLoadingState>(),
        isA<NextDaysForecastErrorState>()
            .having((e) => e.message, 'isNotEmpty', equals('error')),
      ],
    );
  });
}
