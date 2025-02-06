import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter.dart';

class LocalStorageAdapterImpl implements LocalStorageAdapter {
  late Database _database;

  @override
  Future<void> start() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    await applicationDirectory.create();
    final path = join(applicationDirectory.path, 'climaapp.db');
    _database = await databaseFactoryIo.openDatabase(path);
  }

  @override
  Future<Map<String, dynamic>> get({required String store}) async {
    final storeInstance = stringMapStoreFactory.store(store);
    return _database.transaction((transaction) async {
      final snapshot = await storeInstance.find(transaction);
      if (snapshot.isEmpty) return {};
      return snapshot.single.value;
    });
  }
}
