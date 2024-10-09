

import '../../domain/model/Weather.dart';
import '../../domain/repository/weather_repository.dart';
import 'in_memory_weather_repository.dart';
import 'network_weather_repository.dart';

class AppRepository implements WeatherRepository {
  final InMemoryWeatherRepository inMemoryWeatherRepository;
  final NetworkWeatherRepository networkWeatherRepository;

  AppRepository({required this.inMemoryWeatherRepository, required this.networkWeatherRepository});

  @override
  Future<Weather> getWeather() {
    return networkWeatherRepository.getWeather();
  }

}