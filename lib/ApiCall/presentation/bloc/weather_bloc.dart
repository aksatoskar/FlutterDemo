

import 'dart:async';


import 'package:firstflutterapp/ApiCall/presentation/bloc/weather_event.dart';
import 'package:firstflutterapp/ApiCall/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/app_repository.dart';
import '../../domain/model/Weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final AppRepository _appRepository;

  WeatherBloc({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(
        WeatherState(weather: Weather(temperature: 0, windSpeed: 0, weatherConditionList: []), isLoading: false, error: '')
      ) {
    on<LoadWeather>(_onLoad);
  }

  Future<void> _onLoad(LoadWeather event, Emitter<WeatherState> emit) async {
    try {
     emit(state.copyWith(isLoading: true));

     final weather = await _appRepository.getWeather();

     emit(state.copyWith(weather: weather, isLoading: false));

    } on Exception catch (ex) {
      emit(state.copyWith(error: ex.toString(), isLoading: false));
    }
  }
}