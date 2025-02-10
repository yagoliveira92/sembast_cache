import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/view/city_weather_forecast_screen.dart';
import 'package:sembast_cache/src/feature/weather_forecast/cubit/weather_forecast_cubit.dart';
import 'package:sembast_cache/src/feature/weather_forecast/widgets/custom_search_field_widget.dart';
import 'package:sembast_cache/src/feature/weather_forecast/widgets/weather_card_widget.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  final TextEditingController cityTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cityTextController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<WeatherForecastCubit>().filterCities(cityTextController.text);
  }

  @override
  void dispose() {
    cityTextController.removeListener(_onSearchChanged);
    cityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00457D),
      body: Ink(
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(32, 80, 32, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF00457D),
              Color(0xFF05051F),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocConsumer<WeatherForecastCubit, WeatherForecastState>(
          listener: (context, state) {
            if (state is WeatherForecastSuccess && !state.hasConnectivity) {
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  overflowAlignment: OverflowBarAlignment.end,
                  backgroundColor: Color(0xFF011D34),
                  dividerColor: Color(0xFF011D34),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4,
                    color: Colors.white,
                  ),
                  content: Column(
                    children: [
                      Text(
                        'Sua conexão com a internet foi perdida.'
                        ' A previsão pode estar desatualizada.',
                        softWrap: true,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => ScaffoldMessenger.of(context)
                          .hideCurrentMaterialBanner(),
                      child: Text('Fechar'),
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            return switch (state) {
              WeatherForecastSuccess() => CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        children: <Widget>[
                          CustomSearchFieldWidget(
                              onChanged: context
                                  .read<WeatherForecastCubit>()
                                  .filterCities,
                              controller: cityTextController),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return WeatherCardWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CityWeatherForecastScreen(
                                    weatherModel: state.weatherData[index],
                                  ),
                                ),
                              );
                            },
                            conditionSlug:
                                state.weatherData[index].forecast[0].condition,
                            cityName: state.weatherData[index].cityName,
                            temperature: state
                                .weatherData[index].forecast[0].max
                                .toString(),
                          );
                        },
                        childCount: state.weatherData.length,
                      ),
                    ),
                  ],
                ),
              WeatherForecastError() => Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                ),
            };
          },
        ),
      ),
    );
  }
}
