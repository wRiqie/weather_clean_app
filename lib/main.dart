import 'package:flutter/material.dart';
import 'package:weather_clean_app/core/inject.dart';
import 'package:weather_clean_app/features/presentation/ui/screens/weather_screen.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather clean app',
      theme: ThemeData.light(),
      home: const WeatherScreen(),
    );
  }
}