import 'package:flutter/material.dart';

class DetailsWeatherCardWidget extends StatelessWidget {
  const DetailsWeatherCardWidget({super.key});

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
          const Text(
            "Hoje (03/12)",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Icon(
            Icons.sunny,
            size: 64,
          ),
          Text(
            "32°",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text("Sol entre nuvens"),
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
              const Expanded(
                child: Text(
                  "80%",
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
              const Expanded(
                child: Text("20/34°", textAlign: TextAlign.right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
