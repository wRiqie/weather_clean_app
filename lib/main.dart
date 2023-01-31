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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}