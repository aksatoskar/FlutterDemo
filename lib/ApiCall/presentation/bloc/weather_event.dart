import 'package:equatable/equatable.dart';

sealed class WeatherEvent extends Equatable {

  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

final class LoadWeather extends WeatherEvent{
  const LoadWeather();
}

final class GetWeather extends WeatherEvent {
  final String city;

  const GetWeather({required this.city});

  @override
  List<Object?> get props => [city];
}