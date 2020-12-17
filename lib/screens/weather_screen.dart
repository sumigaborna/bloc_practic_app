import 'package:bloc_practic_app/blocs/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc practice app'),
      ),
      body: Text('ovdje će ići stream'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<WeatherBloc>(context).add(WeatherEvent.getWeather);
        },
        tooltip: 'Get Weather Description',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
