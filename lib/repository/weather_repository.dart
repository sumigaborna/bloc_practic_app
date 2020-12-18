import 'package:bloc_practic_app/repository/weather_api.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final WeatherApi weatherApi = WeatherApi();

  Future getWeather() async => await weatherApi.getWeather(new http.Client());
}
