import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter.dart';

class LocalDataService {

  LocalDataService({
    required LocalStorageAdapter localStorageAdapter,
  }) : _localStorageAdapter = localStorageAdapter;

  final LocalStorageAdapter _localStorageAdapter;

  Future<Map<String, dynamic>> getData(String store) async {
    return await _localStorageAdapter.get(store: store);
  }

  Future<bool> saveData(String store, Map<String, dynamic> data) async {
    try {
      await _localStorageAdapter.eraseAndAdd(store: store, data: data);
      return true;
    } catch (e) {
      print('Erro ao salvar dados locais: $e');
      return false;
    }
  }

  Future<bool> clearData(String store) async {
    try {
      await _localStorageAdapter.eraseAndAdd(store: store, data: {});
      return true;
    } catch (e) {
      print('Erro ao limpar dados locais: $e');
      return false;
    }
  }
}