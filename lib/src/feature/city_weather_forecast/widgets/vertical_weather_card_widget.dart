import 'package:flutter/material.dart';

class VerticalWeatherCardWidget extends StatelessWidget {
  const VerticalWeatherCardWidget({
    super.key,
    required this.weekDay,
    required this.temperature,
    required this.date,
    required this.imageUrl,

  });

  final String weekDay;
  final String date;
  final String temperature;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0x15FFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(weekDay),
            const SizedBox(
              height: 4,
            ),
            Text(date),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.sunny),
            ),
            Text(
              temperature,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
