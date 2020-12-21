import 'package:bloc_practic_app/blocs/weather_bloc.dart';
import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/blocs/weather_state.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('Weather bloc tests', () {
    WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    test(
        'Given a weather bloc, When weatherRepository is null, Then assertion error should be thrown',
        () {
      expect(() => WeatherBloc(weatherRepository: null), throwsAssertionError);
    });

    group('Tests to event: getWeather', () {
      blocTest(
          'emits [WeatherLoadInProgress, WeatherLoadSuccess], When getWeather is added and succeeds',
          build: () => WeatherBloc(weatherRepository: weatherRepository),
          act: (WeatherBloc bloc) => bloc.add(WeatherEvent.getWeather),
          expect: [
            isA<WeatherLoadInProgress>(),
            isA<WeatherLoadSuccess>(),
          ]);
    });
  });
}
