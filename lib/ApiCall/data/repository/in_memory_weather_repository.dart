
import '../../domain/model/Weather.dart';
import '../../domain/repository/weather_repository.dart';

class InMemoryWeatherRepository implements WeatherRepository {

  @override
  Future<Weather> getWeather() async {
    await Future.delayed(const Duration(seconds: 3));
    return Weather(temperature: 31, windSpeed: 100.00, weatherConditionList: []);
  }
}