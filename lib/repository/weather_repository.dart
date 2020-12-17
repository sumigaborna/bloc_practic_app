import 'package:bloc_practic_app/repository/weather_api.dart';

class WeatherRepository {
  final WeatherApi weatherApi = WeatherApi();

  Future getWeather() async => await weatherApi.getWeather();
}
