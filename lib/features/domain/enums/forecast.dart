enum Forecast {
  clean(id: 1),
  rain(id: 2),
  cloudy(id: 3),
  storm(id: 4);

  const Forecast({required this.id});

  final int id;
}
