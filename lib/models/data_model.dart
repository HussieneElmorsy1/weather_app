class DataModel {
  final String cityName, date;
  final List<Forecastday> forecastday;

  DataModel({required this.date, required this.cityName, required this.forecastday});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      cityName: json['location']['name'], // Assuming 'name' is within 'location'
      date: json['location']['localtime'],
      forecastday: (json['forecast']['forecastday'] as List)
          .map((i) => Forecastday.fromJson(i))
          .toList(),
    );
  }
}

class Forecastday {
  final Day day;

  Forecastday({required this.day});

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(day: Day.fromJson(json['day']));
  }
}

class Day {
  final double maxtempC;
  final double mintempC;
  final double avgtempC;
  final Condition condition;

  Day({
    required this.condition,
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      condition: Condition.fromJson(json['condition']),
      maxtempC: json['maxtemp_c'].toDouble(),
      mintempC: json['mintemp_c'].toDouble(),
      avgtempC: json['avgtemp_c'].toDouble(),
    );
  }
}

class Condition {
  final String text;
  final String icon;

  Condition({required this.text, required this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
    );
  }
}
