import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  //TODO: this should be broken up into more static parts
  static final url =
      'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=130&appid=bc1f2d39eb7648195a05bba292527f99';

  Future<dynamic> getWeather() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      print('status code: ${response.statusCode}');
  }
}
