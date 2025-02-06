import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sembast_cache/src/core/http_adapter/http_adapter.dart';
import 'package:sembast_cache/src/core/http_adapter/http_adapter_impl.dart';
import 'package:sembast_cache/src/core/injection_adapter/injection_adapter_impl.dart';
import 'package:sembast_cache/src/core/services/connectivity_service.dart';
import 'package:sembast_cache/src/core/services/weather_api_service.dart';

final getIt = GetIt.instance;
final dependency = InjectionAdapterImpl(getIt);
final http.Client client = http.Client();

Future<void> init() async {
  dependency.registerFactory<ConnectivityService>(
    ConnectivityService(),
  );
  dependency.registerLazySingleton<HttpAdapter>(
    HttpAdapterImpl(
      client,
    ),
  );
  dependency.registerFactory<WeatherApiService>(
    WeatherApiService(
      httpAdapter: dependency.get(),
    ),
  );
}
