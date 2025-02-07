import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter.dart';

class LocalStorageService {
  LocalStorageService(this._adapter);
  LocalStorageAdapter _adapter;

  Future<Map<String, dynamic>> fetchData(String cityName) async {
    try {
      return await _adapter.get(store: 'weather_forecast_$cityName');
    } catch (e) {
      return {};
    }
  }

  Future<void> saveData(String cityName, Map<String, dynamic> data) async {
    try {
      await _adapter.eraseAndAdd(
          store: 'weather_forecast_$cityName', data: data);
    } catch (e) {
      Exception('Erro ao salvar os dados');
    }
  }
}
