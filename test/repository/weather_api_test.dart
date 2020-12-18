import 'package:bloc_practic_app/repository/weather_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('Weather api tests', () {
    final client = MockClient();
    final weatherApi = WeatherApi();
    test(
        'Given a call to getWeather,When response is successful, Then getWeather should return statusCode==200',
        () async {
      when(client.get(OPENWEATHER_URL))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
      expect(await weatherApi.getWeather(client), isA<dynamic>());
    });

    test('throws an exception if the http call completes with an error',
        () async {
      when(client.get(OPENWEATHER_URL))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(weatherApi.getWeather(client), throwsException);
    });
  });
}
