import 'package:weather_clean_app/domain/entities/location_entity.dart';

abstract class DayForecastEvent {}

class DayForecastLoadEvent extends DayForecastEvent {
  final DateTime date;
  final LocationEntity location;

  DayForecastLoadEvent(this.date, this.location);
}