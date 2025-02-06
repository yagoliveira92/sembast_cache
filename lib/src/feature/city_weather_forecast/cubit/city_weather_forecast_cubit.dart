import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'city_weather_forecast_state.dart';

class CityWeatherForecastCubit extends Cubit<CityWeatherForecastState> {
  CityWeatherForecastCubit() : super(CityWeatherForecastInitial());
}
