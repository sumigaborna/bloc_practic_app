import 'package:bloc_practic_app/repository/weather_api.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  WeatherRepository([this._client]);

  http.Client _client;

  final WeatherApi _weatherApi = WeatherApi();

  //client can be null because it's a optional value, hence if it's null new client will be created
  Future getWeather() async =>
      await _weatherApi.getWeather(_client ?? new http.Client());
}
