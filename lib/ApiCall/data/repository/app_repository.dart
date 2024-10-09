

import 'package:firstflutterapp/ApiCall/domain/model/Comment.dart';
import 'package:firstflutterapp/ApiCall/domain/repository/comment_repository.dart';

import '../../domain/model/Weather.dart';
import '../../domain/repository/weather_repository.dart';
import 'in_memory_weather_repository.dart';
import 'network_comment_repository.dart';
import 'network_weather_repository.dart';

class AppRepository implements WeatherRepository, CommentRepository {
  final InMemoryWeatherRepository inMemoryWeatherRepository;
  final NetworkWeatherRepository networkWeatherRepository;
  final NetworkCommentRepository networkCommentRepository;

  AppRepository({required this.inMemoryWeatherRepository, required this.networkWeatherRepository, required this.networkCommentRepository});

  @override
  Future<Weather> getWeather() {
    return networkWeatherRepository.getWeather();
  }

  @override
  Future<List<Comment>> fetchComments() {
    return networkCommentRepository.fetchComments();
  }

}