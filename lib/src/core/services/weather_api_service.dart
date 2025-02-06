import 'dart:convert';

import 'package:sembast_cache/src/core/enviroments/enviroments_enum.dart';
import 'package:sembast_cache/src/core/http_adapter/http_adapter.dart';
import 'package:sembast_cache/src/core/models/weather_model.dart';

class WeatherApiService {

  WeatherApiService({
    required this.httpAdapter,
  });

  final HttpAdapter httpAdapter;
  final enumEnv = EnvironmentEnum.constants;

  Future<WeatherModel> fetchData(String cityName) async {
    final response = await httpAdapter.get(
      '${enumEnv.apiBaseUrl}?key=${enumEnv.apiKey}&city_name=$cityName&unit=metric',
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body)['results']);
    } else {
      throw Exception('Falha ao carregar dados do clima');
    }
  }
}
