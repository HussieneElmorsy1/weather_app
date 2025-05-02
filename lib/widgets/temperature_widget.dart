import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_app/models/weather_model.dart';

class TemperatureWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const TemperatureWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl: weatherModel.image.startsWith('https:')
                ? weatherModel.image
                : 'https:${weatherModel.image}',
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(
            '${weatherModel.temp.round()}°C',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Column(
            children: [
              Text('Max: ${weatherModel.maxTemp.round()}°C'),
              Text('Min: ${weatherModel.minTemp.round()}°C'),
            ],
          ),
        ],
      ),
    );
  }
}
