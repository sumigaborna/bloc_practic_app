import 'dart:async';

import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/blocs/weather_state.dart';
import 'package:bloc_practic_app/models/weather_data.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherData> {
  WeatherBloc(WeatherRepository weatherRepository)
      : assert(weatherRepository != null),
        _weatherRepository = WeatherRepository(),
        super(WeatherInitial());

  final WeatherRepository _weatherRepository;

  BehaviorSubject<WeatherData> _weatherStreamController =
      BehaviorSubject<WeatherData>();

  get weatherStream => _weatherStreamController.stream;

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherEvent) yield* _mapWeatherEventToState(event);
  }

  Stream<WeatherState> _mapWeatherEventToState(WeatherEvent event) async* {
    yield WeatherLoadInProgress();
    try {
      final weather = await _weatherRepository.getWeather();
      var newState = WeatherData(weather['weather'][0]['description']);
      _weatherStreamController.add(newState);
      yield WeatherLoadSuccess(weatherData: weather);
    } catch (e) {
      _weatherStreamController.addError(
          'I\'m sorry there seems to be some kind of an error, try me again :)');
      yield WeatherLoadFailure();
    }
  }

  @override
  Future<void> close() {
    _weatherStreamController.close();
    return super.close();
  }
}
