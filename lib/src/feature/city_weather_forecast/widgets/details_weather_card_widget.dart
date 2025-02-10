import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sembast_cache/src/core/enviroments/enviroments_enum.dart';
import 'package:sembast_cache/src/core/models/weather_model.dart';

class DetailsWeatherCardWidget extends StatelessWidget {
  const DetailsWeatherCardWidget({required this.weatherModel, super.key});

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF4463D5),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Hoje ${weatherModel.date}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CachedNetworkSVGImage(
            "${EnvironmentEnum.constants.imageUrl}${weatherModel.conditionSlug}.svg",
          ),
          Text(
            "${weatherModel.temp}°",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(weatherModel.description),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/icones/water_drop.png"),
                      alignment: Alignment.center),
                ),
              ),
              const Text(
                "Umidade:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Text(
                  "${weatherModel.humidity}%",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/icones/device_thermostat.png"),
                      alignment: Alignment.center),
                ),
              ),
              const Text(
                "Min/Max:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Text(
                    "${weatherModel.forecast[0].min}/${weatherModel.forecast[0].max}°",
                    textAlign: TextAlign.right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
