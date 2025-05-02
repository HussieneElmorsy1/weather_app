import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String key = 'd0df7af43aa64ab8baa100527242807';
  final int days = 1;
  final String baseUrl = "https://api.weatherapi.com/v1";

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get('$baseUrl/forecast.json', queryParameters: {
        'key': key,
        'q': cityName,
        'days': days,
      });

      // Parse weather data if the response is successful
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      // Extract error message from the API response if available
      final String errorMessage = e.response?.data['error']['message'] ?? 
          'Oops, there was an error, try again later';

      // Log the error and throw a WeatherModelError
      log('API Error: $errorMessage');
      throw WeatherModelError(message: errorMessage);
    } catch (e) {
      // Catch any other errors and throw a generic error message
      log(e.toString());
      throw WeatherModelError(message: 'Oops, there was an error, try again later');
    }
  }
}
