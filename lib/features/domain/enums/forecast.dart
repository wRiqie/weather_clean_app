import 'package:weather_clean_app/core/images.dart';

enum Forecast {
  clean(id: 1, imgPath: Images.cloudSun),
  rain(id: 2, imgPath: Images.cloudSunRain),
  cloudy(id: 3, imgPath: Images.cloud),
  storm(id: 4, imgPath: Images.cloudRain);

  const Forecast({required this.id, required this.imgPath});

  final int id;
  final String imgPath;
}
