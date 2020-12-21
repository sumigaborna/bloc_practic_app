import 'package:bloc_practic_app/repository/weather_api.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final WeatherApi _weatherApi = WeatherApi();

  Future getWeather(http.Client client) async =>
      await _weatherApi.getWeather(client);
}
