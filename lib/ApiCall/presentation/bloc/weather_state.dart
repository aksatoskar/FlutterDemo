

import 'package:equatable/equatable.dart';

import '../../domain/model/Weather.dart';

class WeatherState extends Equatable {
  final Weather weather;
  final bool isLoading;
  final String error;

  @override
  List<Object?> get props =>[weather, isLoading, error];

  const WeatherState({
    required this.weather,
    required this.isLoading,
    required this.error,
  });

  WeatherState copyWith({
    Weather? weather,
    bool? isLoading,
    String? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}