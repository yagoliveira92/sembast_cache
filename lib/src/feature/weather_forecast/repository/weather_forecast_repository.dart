import 'package:sembast_cache/src/core/models/weather_model.dart';

abstract class WeatherRepository {
  Future<
      ({
        bool hasConnectivity,
        List<WeatherModel> weatherList,
      })> getWeatherData();
}
