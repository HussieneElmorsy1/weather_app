class WeatherModel {
  final String cityName, image, weatherCondition, country, region;
  final double temp, maxTemp, minTemp;
  final DateTime date;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.country,
      required this.region,
      required this.weatherCondition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json["location"]["name"],
        country: json["location"]["country"],
        region: json["location"]["region"],
        date: DateTime.parse( json['current']['last_updated'] ),
        image: json['current']["condition"]['icon'],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherCondition: json['current']["condition"]['text']);
  }
}

class WeatherModelError {
  final String message;

  WeatherModelError({required this.message});

  factory WeatherModelError.fromJson(Map<String, dynamic> json) {
    return WeatherModelError(message: json['error']['message']);
  }
}
