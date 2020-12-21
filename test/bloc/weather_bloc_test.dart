import 'dart:convert';

import 'package:bloc_practic_app/blocs/weather_bloc.dart';
import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/blocs/weather_state.dart';
import 'package:bloc_practic_app/models/weather_data.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../common_test/utils.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('Weather bloc tests', () {
    WeatherRepository weatherRepository;
    WeatherBloc weatherBloc;
    http.Client client;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
      client = MockClient();
    });

    test(
        'Given a weather bloc, When weatherRepository is null, Then assertion error should be thrown',
        () {
      expect(() => WeatherBloc(weatherRepository: null), throwsAssertionError);
    });

    group('Tests to event: getWeather', () {
      var _successResponse = http.Response(MOCK_OPEN_WEATHER_RESPONSE, 200);
      var weatherData = WeatherData(
          jsonDecode(_successResponse.body)['weather'][0]['description']);
      blocTest(
          //BEFORE YOU RUN THE TEST, IN "MOCK_OPEN_WEATHER_RESPONSE" CHANGE WEATHER DESCRIPTION ("description") TO THE ONE THAT WAS LAST DISPLAYED ON THE DEVICE, OTHERWISE TEST WILL NOT PASS
          'emits [WeatherLoadInProgress, WeatherLoadSuccess], When getWeather is added and succeeds',
          build: () {
            when(weatherRepository.getWeather(client))
                .thenAnswer((_) => Future.value(weatherData));
            return weatherBloc;
          },
          act: (WeatherBloc bloc) => bloc.add(WeatherEvent.getWeather),
          expect: [
            WeatherLoadInProgress(),
            WeatherLoadSuccess(weatherData: weatherData),
          ]);
    });
  });
}
