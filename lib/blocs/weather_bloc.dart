import 'dart:async';

import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/blocs/weather_state.dart';
import 'package:bloc_practic_app/models/weather_data.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({@required WeatherRepository weatherRepository})
      : assert(weatherRepository != null),
        _weatherRepository = WeatherRepository(),
        super(WeatherInitial());

  final WeatherRepository _weatherRepository;

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherEvent) yield* _mapWeatherEventToState(event);
  }

  Stream<WeatherState> _mapWeatherEventToState(WeatherEvent event) async* {
    yield WeatherLoadInProgress();
    try {
      //THIS IS BAD, YOU DON'T WANT BLOC TO KNOW ABOUT HTTP CLIENT!!!
      final weather = await _weatherRepository.getWeather();
      var weatherData = WeatherData(weather['weather'][0]['description']);
      yield WeatherLoadSuccess(weatherData: weatherData);
    } catch (e) {
      yield WeatherLoadFailure();
    }
  }
}
