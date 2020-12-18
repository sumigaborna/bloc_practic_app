import 'dart:convert';

import 'package:http/http.dart' as http;

//TODO: this should be broken up into more static parts, also this is just for testing purposes, so ¯\_(ツ)_/¯
const String OPENWEATHER_URL =
    'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=130&appid=bc1f2d39eb7648195a05bba292527f99';

class WeatherApi {
  Future<dynamic> getWeather(http.Client client) async {
    http.Response response = await client.get(OPENWEATHER_URL);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      throw Exception('Failed to get weather info');
  }
}
