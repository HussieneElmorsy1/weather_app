import 'package:weather_app/models/weather_model.dart';

// Base state class
class GetWeatherState {}

// Initial state when no data has been loaded yet
class WeatherInitialState extends GetWeatherState {}

// State when weather data is successfully loaded
class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

// State when an error occurs (e.g., API error)
class WeatherFailureState extends GetWeatherState {
  final WeatherModelError weatherModelError;

  WeatherFailureState(this.weatherModelError);
}
