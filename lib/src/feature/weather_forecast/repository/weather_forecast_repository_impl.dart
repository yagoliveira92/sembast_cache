import 'package:sembast_cache/src/core/models/weather_model.dart';
import 'package:sembast_cache/src/core/services/connectivity_service.dart';
import 'package:sembast_cache/src/core/services/weather_api_service.dart';
import 'package:sembast_cache/src/feature/weather_forecast/repository/weather_forecast_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;
  final ConnectivityService _connectivityService;

  WeatherRepositoryImpl(
    this._weatherApiService,
    this._connectivityService,
  );

  @override
  Future<List<WeatherModel>> getWeatherData() async {
    final hasConnection = await _connectivityService.hasInternetConnection();
    List<String> cities = ['Sorriso', 'Barreiras', 'Rio Verde', 'Maracaju'];
    List<WeatherModel> weatherData = [];
    if (hasConnection) {
      await Future.forEach(cities, (city) async {
        try {
          final data = await _weatherApiService.fetchData(city);
          weatherData.add(data);
        } catch (e) {
          print(e);
        }
      });
    } else {
      throw Exception('No internet connection');
    }
    return weatherData;
  }
}
