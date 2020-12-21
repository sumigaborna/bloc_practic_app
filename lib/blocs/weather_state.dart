import 'package:bloc_practic_app/models/weather_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final WeatherData weatherData;

  const WeatherLoadSuccess({@required this.weatherData});

  @override
  List<Object> get props => [weatherData];
}

class WeatherLoadFailure extends WeatherState {}
