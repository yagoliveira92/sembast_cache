import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sembast_cache/src/core/http_adapter/http_adapter.dart';
import 'package:sembast_cache/src/core/http_adapter/http_adapter_impl.dart';
import 'package:sembast_cache/src/core/injection_adapter/injection_adapter_impl.dart';
import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter.dart';
import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter_impl.dart';
import 'package:sembast_cache/src/core/services/connectivity_service.dart';
import 'package:sembast_cache/src/core/services/weather_api_service.dart';
import 'package:sembast_cache/src/feature/weather_forecast/injection/weather_injection_container.dart';

final getIt = GetIt.instance;
final dependency = InjectionAdapterImpl(getIt);
final http.Client client = http.Client();

Future<void> init() async {
  dependency.registerLazySingleton<LocalStorageAdapter>(
    LocalStorageAdapterImpl(),
  );

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
  final weatherForecast = WeatherForecastInjectionContainer();
  weatherForecast(dependency);
}
