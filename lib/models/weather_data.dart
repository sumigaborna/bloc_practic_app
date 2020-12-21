import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  final weatherDescription;

  WeatherData(this.weatherDescription);

  @override
  List<Object> get props => [weatherDescription];
}
