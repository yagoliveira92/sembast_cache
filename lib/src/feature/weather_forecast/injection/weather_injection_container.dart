import 'package:sembast_cache/src/core/injection_adapter/injection_adapter.dart';
import 'package:sembast_cache/src/core/services/connectivity_service.dart';
import 'package:sembast_cache/src/core/services/weather_api_service.dart';
import 'package:sembast_cache/src/feature/weather_forecast/repository/weather_forecast_repository.dart';
import 'package:sembast_cache/src/feature/weather_forecast/repository/weather_forecast_repository_impl.dart';

class WeatherForecastInjectionContainer {
  void call(InjectionAdapter dependency) {
    dependency.registerFactory<WeatherRepository>(
      WeatherRepositoryImpl(
        dependency.get<WeatherApiService>(),
        dependency.get<ConnectivityService>(),
      ),
    );
  }
}
