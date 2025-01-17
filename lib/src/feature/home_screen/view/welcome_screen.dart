import 'package:flutter/material.dart';
import 'package:sembast_cache/src/feature/weather_forecast/view/weather_forecast_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 3,
              ),
              Image.asset("assets/logo/logo.png", width: 200),
              Spacer(),
              Image.asset("assets/imagens/ilustra.png"),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Boas-vindas!",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 24,
                      ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              ElevatedButton(
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 22,
                      color: Colors.black,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherForecastScreen(),
                    ),
                  );
                },
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
