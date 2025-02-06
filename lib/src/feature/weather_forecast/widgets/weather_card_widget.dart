import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sembast_cache/src/core/enviroments/enviroments_enum.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.onTap,
    required this.conditionSlug,
  });

  final String cityName;
  final String temperature;
  final String conditionSlug;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          onTap();
        },
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0x15FFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.network(
                "${EnvironmentEnum.constants.imageUrl}$conditionSlug.svg",
                width: 32,
              ),
              Text(cityName),
              Text(
                temperature,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
