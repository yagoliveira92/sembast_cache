import 'package:flutter/material.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.onTap,
  });

  final String cityName;
  final String temperature;
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
              const Icon(Icons.sunny),
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
