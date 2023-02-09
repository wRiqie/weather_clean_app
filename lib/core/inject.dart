import 'package:get_it/get_it.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_bloc.dart';

import '../features/data/datasources/get_day_weather_forecast_datasource.dart';
import '../features/data/datasources/get_next_day_weather_forecasts_datasource.dart';
import '../features/data/datasources/local/get_day_weather_forecast_local_datasource_imp.dart';
import '../features/data/datasources/local/get_next_day_weather_forecasts_local_datasource_imp.dart';
import '../features/data/repositories/get_day_weather_forecast_repository_imp.dart';
import '../features/data/repositories/get_next_day_weather_forecasts_repository_imp.dart';
import '../features/domain/repositories/get_day_weather_forecast_repository.dart';
import '../features/domain/repositories/get_next_day_weather_forecasts_repository.dart';
import '../features/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase.dart';
import '../features/domain/usecases/get_day_weather_forecasts/get_day_weather_forecasts_usecase_imp.dart';
import '../features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase.dart';
import '../features/domain/usecases/get_next_day_weather_forecasts/get_next_day_weather_forecasts_usecase_imp.dart';

class Inject {
  static void init() {
    final getIt = GetIt.I;

    // datasources
    getIt.registerLazySingleton<GetDayWeatherForecastDataSource>(
        () => GetDayWeatherForecastLocalDataSourceImp());
    getIt.registerLazySingleton<GetNextDayWeatherForecastsDatasource>(
        () => GetNextDayWeatherForecastsLocalDatasourceImp());

    // repositories
    getIt.registerLazySingleton<GetDayWeatherForecastRepository>(
        () => GetDayWeatherForecastRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetNextDayWeatherForecastsRepository>(
        () => GetNextDayWeatherForecastsRepositoryImp(getIt()));

    // usecases
    getIt.registerLazySingleton<GetDayWeatherForecastsUseCase>(
        () => GetDayWeatherForecastsUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetNextDayWeatherForecastsUseCase>(
        () => GetNextDayWeatherForecastsUseCaseImp(getIt()));

    // blocs
    getIt.registerFactory<WeatherBloc>(() => WeatherBloc(getIt(), getIt()));
  }
}
