import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_forecast_state.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit() : super(WeatherForecastInitial());
}
