import 'package:bloc_practic_app/models/weather_data.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WeatherEvent { getWeather }

class WeatherBloc extends Bloc<WeatherEvent, WeatherData> {
  final WeatherRepository _weatherRepository = WeatherRepository();
  WeatherBloc() : super(WeatherData("no weather description"));

  @override
  Stream<WeatherData> mapEventToState(WeatherEvent event) async* {
    switch (event) {
      case WeatherEvent.getWeather:
        {
          try {
            dynamic responseBody = await _weatherRepository.getWeather();
            var newState =
                WeatherData(responseBody['weather'][0]['description']);
            yield newState;
            break;
          } catch (e) {
            //TODO: print user error
            print(e);
          }
        }
    }
  }
}
