import 'package:flutter/material.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/widgets/details_weather_card_widget.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/widgets/vertical_weather_card_widget.dart';

class CityWeatherForecastScreen extends StatelessWidget {
  const CityWeatherForecastScreen({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(cityName),
      ),
      body: Ink(
        padding: const EdgeInsets.fromLTRB(32, 128, 32, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xFF00457D),
            Color(0xFF05051F),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: const Column(
          children: <Widget>[
            DetailsWeatherCardWidget(),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                VerticalWeatherCardWidget(
                  weekDay: "Segunda",
                  temperature: "25°",
                  date: "03/12",
                ),
                VerticalWeatherCardWidget(
                  weekDay: "Segunda",
                  temperature: "25°",
                  date: "03/12",
                ),
                VerticalWeatherCardWidget(
                  weekDay: "Segunda",
                  temperature: "25°",
                  date: "03/12",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
