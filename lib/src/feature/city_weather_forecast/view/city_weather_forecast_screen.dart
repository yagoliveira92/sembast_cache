import 'package:flutter/material.dart';
import 'package:sembast_cache/src/core/models/weather_model.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/widgets/details_weather_card_widget.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/widgets/vertical_weather_card_widget.dart';

class CityWeatherForecastScreen extends StatefulWidget {
  const CityWeatherForecastScreen({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  State<CityWeatherForecastScreen> createState() =>
      _CityWeatherForecastScreenState();
}

class _CityWeatherForecastScreenState extends State<CityWeatherForecastScreen> {
  final CarouselController _controller = CarouselController(initialItem: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.weatherModel.city,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 24,
              ),
        ),
      ),
      body: Ink(
        padding: const EdgeInsets.fromLTRB(32, 128, 32, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xFF00457D),
            Color(0xFF05051F),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            DetailsWeatherCardWidget(
              weatherModel: widget.weatherModel,
            ),
            const SizedBox(
              height: 40,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: CarouselView(
                controller: _controller,
                itemExtent: 200,
                shrinkExtent: 200,
                children: List<Widget>.generate(
                  widget.weatherModel.forecast.length,
                  (int index) => VerticalWeatherCardWidget(
                    weekDay: widget.weatherModel.forecast[index].weekday,
                    max: widget.weatherModel.forecast[index].max.toString(),
                    min: widget.weatherModel.forecast[index].min.toString(),
                    date: widget.weatherModel.forecast[index].date,
                    imageUrl: widget.weatherModel.forecast[index].moonPhase,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
