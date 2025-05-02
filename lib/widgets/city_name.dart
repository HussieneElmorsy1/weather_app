import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CityNameWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const CityNameWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      weatherModel.cityName,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
