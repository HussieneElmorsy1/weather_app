import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/styles/styles.dart';
import 'package:weather_app/widgets/city_name.dart';
import 'package:weather_app/widgets/weather_details.dart';
import 'package:weather_app/widgets/temperature_widget.dart';
import 'package:weather_app/widgets/condition_widget.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    bool isLoading = weatherModel == null;
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // getThemeColor(weatherModel.weatherCondition),
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CityNameWidget(weatherModel: weatherModel),
              AppGaping.kGap32,
              WeatherDetailsWidget(weatherModel: weatherModel),
              AppGaping.kGap32,
              TemperatureWidget(weatherModel: weatherModel),
              AppGaping.kGap32,
              ConditionWidget(weatherModel: weatherModel),
            ],
          ),
        ),
      ),
    );
  }
}
