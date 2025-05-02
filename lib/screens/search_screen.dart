import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: const Text('Search City'),
        ),
        body: Center(
          child: SizedBox(
            height: 100,
            width: 400,
            child: TextField(
              style: GoogleFonts.poppins(
                color: const Color(0xff020202),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),

              // * و دي بتاخد القيمة مع كل تغير بيحصل*
              // onChanged: (value) {
              //   log("value is : $value");
              // },

              // *ودي مش بتتنفز غير بعد ما اضغط علي زر الارسال*
              // onSubmitted: (value) {
              //   log("value is : $value");
              // },

              onSubmitted: (value) async {
                // log("value is : $value");
                // weatherModel = await WeatherService(Dio())
                //     .getCurrentWeather(cityName: value);
                // log(weatherModel!.cityName);
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },

              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 15),
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  // borderSide: BorderSide.none,
                ),
                hintText: "Search City Name",
                hintStyle: GoogleFonts.poppins(
                    color: const Color(0xffb2b2b2),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    decorationThickness: 6),
                suffixIcon: const Icon(Icons.search),
                // prefixIconColor: Colors.black,
                labelText: 'Search',
                labelStyle: GoogleFonts.poppins(
                    // color: Color.fromARGB(255, 115, 115, 115),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    decorationThickness: 6),
              ),
            ),
          ),
        ));
  }
}

// WeatherModel? weatherModel;  //global variable
