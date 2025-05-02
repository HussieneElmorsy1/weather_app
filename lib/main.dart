import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/hom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return MaterialApp(
              title: 'Weather App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition), // Dynamic primarySwatch based on weather
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              home: const HomeScreen(),
            );
          });
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  String normalizedCondition = condition.toLowerCase();

  // Assign colors based on the weather conditions
  switch (normalizedCondition) {
    case 'sunny':
    case 'clear':
      return Colors.orange; // Sunny/Clear
    case 'partly cloudy':
      return Colors.lightBlue; // Partly Cloudy
    case 'cloudy':
      return Colors.grey; // Cloudy
    case 'overcast':
      return Colors.blueGrey; // Overcast
    case 'mist':
    case 'fog':
      return Colors.lightGreen; // Mist/Fog
    default:
      // Handle more complex conditions
      if (normalizedCondition.contains('rain')) {
        if (normalizedCondition.contains('heavy')) {
          return Colors.deepOrange; // Heavy Rain
        }
        return Colors.blueGrey; // Any rain condition
      } else if (normalizedCondition.contains('snow')) {
        if (normalizedCondition.contains('heavy')) {
          return Colors.cyan; // Heavy Snow
        }
        return Colors.lightBlue; // General Snow
      } else if (normalizedCondition.contains('sleet')) {
        return Colors.blueGrey; // Sleet
      } else if (normalizedCondition.contains('drizzle')) {
        return Colors.lightGreen; // Light Drizzle
      } else if (normalizedCondition.contains('thunder')) {
        return Colors.yellow; // Thunderstorms
      } else if (normalizedCondition.contains('blizzard')) {
        return Colors.red; // Blizzard
      } else if (normalizedCondition.contains('ice pellets')) {
        return Colors.teal; // Ice Pellets
      } else if (normalizedCondition.contains('light') &&
          (normalizedCondition.contains('rain') ||
              normalizedCondition.contains('snow'))) {
        return Colors.lightBlue; // Light Rain/Snow
      } else if (normalizedCondition.contains('patchy')) {
        return Colors.amber; // Patchy conditions
      } else if (normalizedCondition.contains('torrential')) {
        return Colors.purple; // Torrential Rain Shower
      } else {
        return Colors.blue; // Default color for unknown conditions
      }
  }
}
