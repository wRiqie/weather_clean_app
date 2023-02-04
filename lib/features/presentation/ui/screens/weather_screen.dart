import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_clean_app/core/images.dart';
import 'package:weather_clean_app/features/presentation/ui/widgets/forecast_card.dart';
import 'package:weather_clean_app/features/presentation/ui/widgets/label_icon.dart';
import 'package:weather_clean_app/features/presentation/ui/widgets/next_forecast_list_tile.dart';
import 'package:weather_clean_app/features/presentation/ui/widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // final dayWeatherBloc = GetIt.I.get<DayForecastBloc>();
  // final nextDayWeatherBloc = GetIt.I.get<NextDaysForecastBloc>();

  @override
  Widget build(BuildContext context) {
    const cardColor = Color.fromARGB(77, 0, 16, 38);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF08244F),
                  Color(0xFF134CB5),
                  Color(0xFF0B42AB),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            DropdownButton<String>(
                              hint: Text(
                                'Location',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              value: 'Fortaleza',
                              icon: const Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'Fortaleza',
                                  child: Text('Fortaleza'),
                                ),
                                DropdownMenuItem(
                                  value: 'São Paulo',
                                  child: Text('São Paulo'),
                                ),
                                DropdownMenuItem(
                                  value: 'Barra Bonita',
                                  child: Text('Barra Bonita'),
                                ),
                              ],
                              onChanged: (value) {},
                              underline: Container(),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Image.asset(
                        Images.cloudMoon,
                        width: MediaQuery.of(context).size.width * .35,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '°',
                          style: GoogleFonts.roboto(
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                            color: Colors.transparent,
                          ),
                        ),
                        Text(
                          '28°',
                          style: GoogleFonts.roboto(
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Precipitations',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Max.: 31°',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Min.: 31°',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cardColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          LabelIcon(
                            icon: Icons.grain,
                            label: '6%',
                          ),
                          LabelIcon(
                            icon: Icons.thermostat,
                            label: '90%',
                          ),
                          LabelIcon(
                            icon: Icons.air,
                            label: '19 km/h',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WeatherCard(
                      title: 'Today',
                      subtitleWidget: Text(
                        'Mar, 9',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            ForecastCard(
                              hour: 12,
                              image: Images.cloudSun,
                              temp: 24,
                            ),
                            ForecastCard(
                              hour: 13,
                              image: Images.cloudSun,
                              temp: 24,
                            ),
                            ForecastCard(
                              hour: 14,
                              image: Images.cloud,
                              temp: 24,
                              isSelected: true,
                            ),
                            ForecastCard(
                              hour: 15,
                              image: Images.cloudSun,
                              temp: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const WeatherCard(
                      title: 'Next Forecast',
                      subtitleWidget: Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      children: [
                        NextForecastListTile(
                          day: 'Monday',
                          image: Images.rainDrops,
                          max: 15,
                          min: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
