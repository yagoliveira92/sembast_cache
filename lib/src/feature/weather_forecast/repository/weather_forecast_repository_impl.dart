import 'package:sembast_cache/src/core/models/weather_model.dart';
import 'package:sembast_cache/src/core/services/weather_api_service.dart';
import 'package:sembast_cache/src/feature/weather_forecast/repository/weather_forecast_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;

  WeatherRepositoryImpl(
    this._weatherApiService,
  );

  @override
  Future<List<WeatherModel>> getWeatherData() async {
    List<String> cities = ['Sorriso', 'Barreiras', 'Rio Verde', 'Maracaju'];
    List<WeatherModel> weatherData = [];
    await Future.forEach(cities, (city) async {
      try {
        final data = await _weatherApiService.fetchData(city);
        weatherData.add(data);
      } catch (e) {
        throw Exception('Não tem dados');
      }
    });
    return weatherData;
  }
}
