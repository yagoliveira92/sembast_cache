import 'package:sembast_cache/src/core/models/weather_model.dart';
import 'package:sembast_cache/src/core/services/connectivity_service.dart';
import 'package:sembast_cache/src/core/services/local_storage_service.dart';
import 'package:sembast_cache/src/core/services/weather_api_service.dart';
import 'package:sembast_cache/src/feature/weather_forecast/repository/weather_forecast_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;
  final ConnectivityService _connectivityService;
  final LocalStorageService _localStorageService;

  WeatherRepositoryImpl(
    this._weatherApiService,
    this._connectivityService,
    this._localStorageService,
  );

  @override
  Future<
      ({
        bool hasConnectivity,
        List<WeatherModel> weatherList,
      })> getWeatherData() async {
    List<String> cities = ['Sorriso', 'Barreiras', 'Rio Verde', 'Maracaju'];
    List<WeatherModel> weatherData = [];
    final hasConnection = await _connectivityService.hasInternetConnection();
    await Future.forEach(cities, (city) async {
      try {
        if (hasConnection) {
          final data = await _weatherApiService.fetchData(city);
          weatherData.add(data);
          await _localStorageService.saveData(
            city,
            data.toMap(),
          );
        } else {
          final data = await _localStorageService.fetchData(city);
          weatherData.add(
            WeatherModel.fromJson(data),
          );
        }
      } catch (e) {
        throw Exception('Não tem dados');
      }
    });
    return (hasConnectivity: hasConnection, weatherList: weatherData);
  }
}
