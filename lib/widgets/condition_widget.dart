import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class ConditionWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const ConditionWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      weatherModel.weatherCondition,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
