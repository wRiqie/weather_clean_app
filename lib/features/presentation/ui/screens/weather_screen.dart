import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_clean_app/core/extensions.dart';
import 'package:weather_clean_app/core/images.dart';
import 'package:weather_clean_app/features/domain/entities/day_weather_entity.dart';
import 'package:weather_clean_app/features/domain/entities/location_entity.dart';
import 'package:weather_clean_app/features/domain/enums/days_of_week_enum.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_event.dart';
import 'package:weather_clean_app/features/presentation/blocs/weather/weather_state.dart';
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
  final weatherBloc = GetIt.I<WeatherBloc>();

  @override
  void initState() {
    super.initState();
    final location = LocationEntity(
      city: 'Barra Bonita',
      uf: 'SP',
      country: 'Brasil',
      lat: 0,
      long: 0,
    );

    final date = DateTime.now();

    weatherBloc.add(WeatherLoadForecastEvent(date, location));
  }

  @override
  void dispose() {
    weatherBloc.close();
    super.dispose();
  }

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        BlocBuilder<WeatherBloc, WeatherState>(
                            bloc: weatherBloc,
                            builder: (context, state) {
                              if (state.status.isSuccess) {
                                return Text(
                                  '${state.dayWeatherForecasts?.weathers.first.temperature ?? 0}°',
                                  style: GoogleFonts.roboto(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                );
                              }
                              return Text(
                                '0°',
                                style: GoogleFonts.roboto(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              );
                            }),
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
                        BlocBuilder<WeatherBloc, WeatherState>(
                          bloc: weatherBloc,
                          builder: (context, state) {
                            if (state.status.isSuccess) {
                              return Text(
                                'Max.: ${state.dayWeatherForecasts?.weathers.max ?? 0}°',
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              );
                            }
                            return Text(
                              'Max.: 0°',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<WeatherBloc, WeatherState>(
                          bloc: weatherBloc,
                          builder: (context, state) {
                            if (state.status.isSuccess) {
                              return Text(
                                'Min.: ${state.dayWeatherForecasts?.weathers.min ?? 0}°',
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              );
                            }
                            return Text(
                              'Min.: 0°',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            );
                          },
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
                        child: BlocBuilder<WeatherBloc, WeatherState>(
                          bloc: weatherBloc,
                          builder: (context, state) {
                            if (state.status.isSuccess) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabelIcon(
                                    icon: Icons.grain,
                                    label:
                                        '${(state.dayWeatherForecasts?.weathers.first.rainfallChance ?? 0).toStringAsFixed(0)}%',
                                  ),
                                  LabelIcon(
                                    icon: Icons.thermostat,
                                    label:
                                        '${state.dayWeatherForecasts?.weathers.first.temperature ?? 0}%',
                                  ),
                                  LabelIcon(
                                    icon: Icons.air,
                                    label:
                                        '${state.dayWeatherForecasts?.weathers.first.windsVelocity ?? 0} km/h',
                                  ),
                                ],
                              );
                            }

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                LabelIcon(
                                  icon: Icons.grain,
                                  label: '0%',
                                ),
                                LabelIcon(
                                  icon: Icons.thermostat,
                                  label: '0%',
                                ),
                                LabelIcon(
                                  icon: Icons.air,
                                  label: '0 km/h',
                                ),
                              ],
                            );
                          },
                        )),
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
                        BlocBuilder<WeatherBloc, WeatherState>(
                          bloc: weatherBloc,
                          builder: (context, state) {
                            if (state.status.isSuccess) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: state.dayWeatherForecasts?.weathers
                                        .orderByHour
                                        .map((e) => ForecastCard(
                                            hour: e.hour,
                                            image: e.forecast.imgPath,
                                            temp: e.temperature))
                                        .toList() ??
                                    [],
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<WeatherBloc, WeatherState>(
                      bloc: weatherBloc,
                      builder: (context, state) {
                        return WeatherCard(
                          title: 'Next Forecast',
                          subtitleWidget: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          children: state.status.isSuccess
                              ? state.nexDayWeatherForecasts
                                  .map(
                                    (e) => NextForecastListTile(
                                      day: DayOfWeekEnum.getByWeekDay(
                                              e.dayOfWeek)
                                          .name
                                          .toCapitalized,
                                      image: e.forecast.imgPath,
                                      max: e.maxTemp,
                                      min: e.minTemp,
                                    ),
                                  )
                                  .toList()
                              : [],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            bloc: weatherBloc,
            builder: (context, state) {
              return Visibility(
                visible: state.status.isLoading,
                child: Container(
                  color: Colors.black38,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
