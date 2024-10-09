class Weather {
  final double temperature;
  final double windSpeed;
  final List<WeatherCondition> weatherConditionList;

  Weather({required this.temperature, required this.windSpeed, required this.weatherConditionList});

  Map<String, dynamic> toMap() {
    return {
      'temperature': this.temperature,
      'windSpeed': this.windSpeed,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> json) {
    return Weather(
      temperature: (json['main']['temp'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      weatherConditionList: fromJsonList(json['weather'])
    );
  }

  static List<WeatherCondition> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => WeatherCondition.fromMap(item as Map<String, dynamic>)).toList();
  }
}


class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromMap(Map<String, dynamic> json) {
    return WeatherCondition(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }
}