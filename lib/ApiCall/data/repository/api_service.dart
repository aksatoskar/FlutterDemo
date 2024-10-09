import 'package:dio/dio.dart';
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
      final weather = Weather.fromMap(response.data);

      return weather;

    } on Exception catch (ex, st) {
      print('Failed to load candies: $ex, stacktrace: $st');
      throw(ex);
    }
  }
}