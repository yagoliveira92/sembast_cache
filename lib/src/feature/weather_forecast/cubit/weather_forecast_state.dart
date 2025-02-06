part of 'weather_forecast_cubit.dart';

@immutable
sealed class WeatherForecastState {}

class WeatherForecastInitial extends WeatherForecastState {}

class WeatherForecastLoading extends WeatherForecastState {}

class WeatherForecastSuccess extends WeatherForecastState {
  WeatherForecastSuccess(this.weatherData);

  final List<WeatherModel> weatherData;
}

class WeatherForecastError extends WeatherForecastState {
  final String message;

  WeatherForecastError(this.message);
}
