import 'package:flutter/material.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/view/city_weather_forecast_screen.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomSearchFieldWidget(controller: cityTextController),
              const SizedBox(
                height: 32,
              ),
              WeatherCardWidget(
                cityName: "Florianópolis - SC",
                temperature: "25°",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CityWeatherForecastScreen(
                        cityName: "Florianópolis - SC",
                      ),
                    ),
                  );
                },
              ),
              WeatherCardWidget(
                cityName: "Curitiba - PR",
                temperature: "21°",
                onTap: () {},
              ),
              WeatherCardWidget(
                cityName: "São Paulo - SP",
                temperature: "32°",
                onTap: () {},
              ),
              WeatherCardWidget(
                cityName: "Porto Alegre - RS",
                temperature: "19°",
                onTap: () {},
              ),
              WeatherCardWidget(
                cityName: "Toledo - PR",
                temperature: "26°",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
