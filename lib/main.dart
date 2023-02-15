import 'package:flutter/material.dart';

import 'package:weather/weather_widgets/top_widget.dart';
import 'package:weather/weather_widgets/middle_widget.dart';
import 'package:weather/weather_widgets/bottom_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 202, 202, 202),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Column(
            children: const [
              // SizedBox(
              //   height: 0,
              // ),
              TopWidget(),
              MiddleWidget(),
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
