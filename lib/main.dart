import 'package:flutter/material.dart';

import 'package:weather_app/weather_widgets/top_widget.dart';
import 'package:weather_app/weather_widgets/middle_widget.dart';
import 'package:weather_app/weather_widgets/bottom_widget.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherFactory wf = WeatherFactory("3c6dcd53aca5a6a0a34ab6ffdb8699cd");
  Weather? weather;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    Weather? newWeather = await wf.currentWeatherByCityName("Reda");
    setState(() {
      weather = newWeather;
    });
  }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.lightBlue[200],
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const Padding(
//               padding: EdgeInsets.only(bottom: 10.0),
//               child: Text(
//                 'Aktualna pogoda',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Text(
//                 weather != null ? weather!.weatherMain.toString() : 'Loading',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Text(
//                 weather != null
//                     ? '${weather!.temperature!.celsius}\u00B0'
//                     : 'Loading',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 80.0,
//                   fontWeight: FontWeight.w200,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Text(
//                 weather != null
//                     ? weather!.weatherDescription.toString()
//                     : 'Loading',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Text(
//                 'Wilgotność: ${weather != null ? weather!.humidity.toString() : 'Loading'}',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Text(
//                 'Prędkość wiatru: ${weather != null ? '${weather!.windSpeed} km/h' : 'Loading'}',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
            children: [
              // SizedBox(
              //   height: 0,
              // ),
              TopWidget(
                weather: weather,
              ),
              MiddleWidget(
                weather: weather,
              ),
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
