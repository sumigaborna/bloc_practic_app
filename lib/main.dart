import 'package:bloc_practic_app/blocs/weather_bloc.dart';
import 'package:bloc_practic_app/repository/weather_repository.dart';
import 'package:bloc_practic_app/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Bloc app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider<WeatherRepository>(
        create: (context) => WeatherRepository(),
        child: BlocProvider<WeatherBloc>(
            create: (context) =>
                WeatherBloc(RepositoryProvider.of<WeatherRepository>(context)),
            child: WeatherScreen()),
      ),
    );
  }
}
