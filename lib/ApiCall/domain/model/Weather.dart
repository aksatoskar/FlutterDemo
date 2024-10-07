class Weather {
  final String temperature;
  final double windSpeed;

  Weather({required this.temperature, required this.windSpeed});

  Map<String, dynamic> toMap() {
    return {
      'temperature': this.temperature,
      'windSpeed': this.windSpeed,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['temperature'] as String,
      windSpeed: map['windSpeed'] as double,
    );
  }
}