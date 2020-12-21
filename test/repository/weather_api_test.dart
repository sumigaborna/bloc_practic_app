import 'package:bloc_practic_app/repository/weather_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  /* Written with a help of: https://flutter.dev/docs/cookbook/testing/unit/mocking */
  group('Weather api tests', () {
    final client = MockClient();
    final weatherApi = WeatherApi();
    test(
        'Given a call to getWeather, When response is successful, Then getWeather should return a dynamic',
        () async {
      when(client.get(OPENWEATHER_URL))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
      expect(await weatherApi.getWeather(client), isA<dynamic>());
    });

    test(
        'Given a call to getWeather, When response is successful, Then getWeather should return an exception',
        () async {
      when(client.get(OPENWEATHER_URL))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(weatherApi.getWeather(client), throwsException);
    });
  });
}
