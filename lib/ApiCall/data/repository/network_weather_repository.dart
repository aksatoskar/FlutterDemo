

import 'package:firstflutterapp/ApiCall/domain/model/Weather.dart';
import 'package:firstflutterapp/ApiCall/domain/repository/weather_repository.dart';

import 'api_service.dart';

class NetworkWeatherRepository implements WeatherRepository {

  ApiService apiService; 
  
  NetworkWeatherRepository({required this.apiService});
  
  
  @override
  Future<Weather> getWeather() {
    return apiService.fetchWeather(33.44, -94.04);
  }
  
}