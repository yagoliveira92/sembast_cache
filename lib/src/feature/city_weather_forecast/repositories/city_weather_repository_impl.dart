import 'package:sembast_cache/src/core/services/local_data_service.dart';
import 'package:sembast_cache/src/feature/city_weather_forecast/repositories/city_weather_repository.dart';


class CityWeatherRepositoryImpl implements CityWeatherRepository {


  CityWeatherRepositoryImpl({
    required LocalDataService localDataService,
  }) : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Map<String, dynamic>> getLocalWeatherData() async {
    return await _localDataService.getData('weather_store');
  }

  @override
  Future<void> saveLocalWeatherData(Map<String, dynamic> data) async {
    await _localDataService.saveData('weather_store', data);
  }

  @override
  Future<void> clearLocalWeatherData() async {
    await _localDataService.clearData('weather_store');
  }
}