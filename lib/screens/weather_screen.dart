import 'package:bloc_practic_app/blocs/weather_bloc.dart';
import 'package:bloc_practic_app/blocs/weather_events.dart';
import 'package:bloc_practic_app/blocs/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  static WeatherBloc _weatherBloc;

  @override
  Widget build(BuildContext context) {
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc practice app'),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadInProgress) Text('LOADING, PLS WAIT');
        },
        builder: (context, state) {
          if (state is WeatherLoadSuccess)
            return Text(state.weatherData.weatherDescription);
          else if (state is WeatherLoadFailure)
            return Text('Failed to load the weather, pls try again');
          else if (state is WeatherInitial)
            return Text(
                'Yeah, there should be some info about weather here, probably went missing.. Try pressing the button in bottom right :)');
          else
            return Text('Well, something is happening.. pls wait :)');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _weatherBloc.add(WeatherEvent.getWeather);
        },
        tooltip: 'Get Weather Description',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
