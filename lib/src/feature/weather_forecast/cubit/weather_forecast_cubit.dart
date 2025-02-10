import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sembast_cache/src/core/models/weather_model.dart';
import 'package:sembast_cache/src/feature/weather_forecast/repository/weather_forecast_repository.dart';

part 'weather_forecast_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(WeatherForecastInitial());

  final WeatherRepository _weatherRepository;
  List<WeatherModel> weatherData = [];
  Future<void> getWeatherData() async {
    emit(WeatherForecastLoading());
    try {
      final weatherDataRecord = await _weatherRepository.getWeatherData();
      weatherData = weatherDataRecord.weatherList;
      emit(WeatherForecastSuccess(weatherData));
    } catch (e) {
      emit(WeatherForecastError(e.toString()));
    }
  }

  void filterCities(String query) {
    if (state is WeatherForecastSuccess) {
      if (query.isNotEmpty) {
        final successState = state as WeatherForecastSuccess;
        final filteredWeatherData = successState.weatherData.where((weather) {
          return weather.cityName.toLowerCase().contains(query.toLowerCase());
        }).toList();
        emit(WeatherForecastSuccess(filteredWeatherData));
      } else {
        if (state is WeatherForecastSuccess) {
          emit(WeatherForecastSuccess(weatherData));
        }
      }
    }
  }
}
