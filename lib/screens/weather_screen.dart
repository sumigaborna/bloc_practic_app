import 'package:bloc_practic_app/blocs/weather_bloc.dart';
import 'package:bloc_practic_app/models/weather_data.dart';
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
      body: StreamBuilder<WeatherData>(
        initialData: WeatherData('Look outside or press the button ^^'),
        stream: _weatherBloc.weatherStream,
        builder: (context,snapshot) {
          if (snapshot.hasData)
            return Text(snapshot.data.weatherDescription);
          else if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else return Text(snapshot.connectionState.toString());
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
