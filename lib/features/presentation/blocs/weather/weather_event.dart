import '../../../domain/entities/location_entity.dart';

abstract class WeatherEvent {}

class WeatherGetDayForecastEvent extends WeatherEvent {
  final DateTime date;
  final LocationEntity location;

  WeatherGetDayForecastEvent(this.date, this.location);
}

class WeatherGetNextDaysForecastEvent extends WeatherEvent {
  final DateTime date;
  final LocationEntity location;

  WeatherGetNextDaysForecastEvent(this.date, this.location);
}
