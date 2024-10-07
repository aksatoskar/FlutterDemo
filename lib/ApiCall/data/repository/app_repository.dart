

import '../../domain/model/Weather.dart';
import '../../domain/repository/weather_repository.dart';
import 'in_memory_weather_repository.dart';

class AppRepository implements WeatherRepository {
  final InMemoryWeatherRepository inMemoryWeatherRepository;

  AppRepository({required this.inMemoryWeatherRepository});

  @override
  Future<Weather> getWeather() {
    return inMemoryWeatherRepository.getWeather();
  }

}