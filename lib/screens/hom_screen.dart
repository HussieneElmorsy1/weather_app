import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import '../widgets/no_weather_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          // Handle initial state (no weather data yet)
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          }
          // Handle loaded weather data state
          else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          }
          // Handle error state and display error message
          else if (state is WeatherFailureState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.weatherModelError.message,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  const Text(
                    'Please try search again..',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ],
              ),
            );
          }
          // Default to a loading spinner while waiting for data
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
