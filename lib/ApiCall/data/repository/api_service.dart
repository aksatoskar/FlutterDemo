import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firstflutterapp/ApiCall/domain/model/Comment.dart';
import 'package:firstflutterapp/ApiCall/domain/model/Weather.dart';

class ApiService {
  static const _weatherAPIKey = 'weather-api_key';

  Future<Weather> fetchWeather(double lat, double lon) async {
    try {
      const apiKey= String.fromEnvironment(
        _weatherAPIKey,
      );

      Dio dio = Dio();

      dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
        logPrint: (object) {
          print(object);
        }
      ));

      Map<String, dynamic> queryParameter = {
        'lat': lat,
        'lon':lon,
        'appid': apiKey
      };

      final response = await dio.get('https://api.openweathermap.org/data/2.5/weather', queryParameters: queryParameter);
      print('status code ${response.statusCode}');
      final weather = Weather.fromMap(response.data);

     // return Future(() { return weather; });
      //return Future.value(weather);
      //return Future.error(Exception('Exception'));

      return weather;

    } on Exception catch (ex, st) {
      print('Failed to load candies: $ex, stacktrace: $st');
      throw(ex);
    }
  }

  Future<List<Comment>> fetchComments() async {
    try {
      const baseUrl = 'https://jsonplaceholder.typicode.com/comments';
      Dio dio = Dio();

      dio.interceptors.add(LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (object) {
            print(object);
          }
      ));

      final result = await dio.get(baseUrl);
      if (result.statusCode == 200) {
        final comments = Comment.fromJsonList(result.data as List<dynamic>);
        return comments;
      } else {
        throw const HttpException('failed to get comments');
      }
    } catch (e) {
      throw(e);
    }


    
  }

}