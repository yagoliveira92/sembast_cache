import 'dart:io';

class ConnectivityService {
  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('alura.com.br');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
