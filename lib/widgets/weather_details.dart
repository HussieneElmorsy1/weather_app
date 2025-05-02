import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherDetailsWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weatherModel.region}, ${weatherModel.country}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
