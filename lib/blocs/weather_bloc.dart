import 'dart:async';

import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/models/weather_data.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherData> {
  WeatherBloc(WeatherRepository weatherRepository)
      : assert(weatherRepository != null),
        _weatherRepository = WeatherRepository(),
        super(WeatherData("no weather description"));

  final WeatherRepository _weatherRepository;

  BehaviorSubject<WeatherData> _weatherStreamController =
      BehaviorSubject<WeatherData>();

  get weatherStream => _weatherStreamController.stream;

  @override
  Stream<WeatherData> mapEventToState(WeatherEvent event) async* {
    switch (event) {
      case WeatherEvent.getWeather:
        {
          try {
            dynamic responseBody = await _weatherRepository.getWeather();
            var newState =
                WeatherData(responseBody['weather'][0]['description']);
            _weatherStreamController.add(newState);
            break;
          } catch (e) {
            _weatherStreamController.addError(
                'I\'m sorry there seems to be some kind of an error, try me again :)');
          }
        }
    }
  }

  @override
  Future<void> close() {
    _weatherStreamController.close();
    return super.close();
  }
}
