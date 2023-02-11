import '../../../domain/entities/location_entity.dart';

abstract class WeatherEvent {}

class WeatherLoadForecastEvent extends WeatherEvent {
  final DateTime date;
  final LocationEntity location;

  WeatherLoadForecastEvent(this.date, this.location);
}