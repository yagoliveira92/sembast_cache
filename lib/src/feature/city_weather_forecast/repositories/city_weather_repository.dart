abstract class CityWeatherRepository {
  Future<Map<String, dynamic>> getLocalWeatherData();
  Future<void> saveLocalWeatherData(Map<String, dynamic> data);
  Future<void> clearLocalWeatherData();
}
