abstract class LocalStorageAdapter {
  Future<void> start();
  Future<Map<String, dynamic>> get({required String store});
  Future<void> eraseAndAdd({
    required String store,
    required Map<String, dynamic> data,
  });
}
