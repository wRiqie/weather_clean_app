import 'package:weather_clean_app/domain/entities/location_entity.dart';

abstract class NextDaysForecastEvent {}

class NextDaysForecastLoadEvent extends NextDaysForecastEvent {
  final DateTime date;
  final LocationEntity location;

  NextDaysForecastLoadEvent(this.date, this.location);
}