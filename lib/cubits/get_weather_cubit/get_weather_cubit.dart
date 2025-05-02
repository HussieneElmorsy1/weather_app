import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      // Call the weather service to get the weather data
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);

      // Emit loaded state with the weather model if successful
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } on WeatherModelError catch (error) {
      // Catch WeatherModelError and emit failure state with the error message
      emit(WeatherFailureState(error));
    } catch (e) {
      // Catch any unexpected errors
      emit(WeatherFailureState(
          WeatherModelError(message: 'An unknown error occurred')));
    }
  }
}
