import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter.dart';

class LocalStorageAdapterImpl implements LocalStorageAdapter {
  late Database _database;

  @override
  Future<void> start() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    await applicationDirectory.create();
    final path = join(applicationDirectory.path, 'climatempo.db');
    _database = await databaseFactoryIo.openDatabase(path);
  }

  @override
  Future<Map<String, dynamic>> get({
    required String store,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    return _database.transaction(
      (transaction) async {
        final snapshot = await storeInstance.find(
          transaction,
        );
        if (snapshot.isEmpty) return {};
        return snapshot.single.value;
      },
    );
  }

  @override
  Future<void> eraseAndAdd({
    required String store,
    required Map<String, dynamic> data,
  }) async {
    final storeInstance = stringMapStoreFactory.store(store);
    await _database.transaction(
      (transaction) {
        storeInstance.drop(transaction);
        return storeInstance.add(
          transaction,
          Map<String, dynamic>.from(data),
        );
      },
    );
  }
}
