
import '../model/Weather.dart';

abstract interface class WeatherRepository{
  Future<Weather> getWeather();
}