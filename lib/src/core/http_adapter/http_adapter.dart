import 'package:http/http.dart' as http;

abstract class HttpAdapter {
  Future<http.Response> get(String url);
}