import 'package:http/http.dart' as http;
import 'package:sembast_cache/src/core/http_adapter/http_adapter.dart';

class HttpAdapterImpl implements HttpAdapter {
  final http.Client client;

  HttpAdapterImpl(this.client);

  @override
  Future<http.Response> get(String url) async {
    return await client.get(Uri.parse(url));
  }
}