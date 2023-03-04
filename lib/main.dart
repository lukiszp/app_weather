import 'package:flutter/material.dart';
import 'package:weather_app/weather_screens/main_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

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
      // home: const WeatherScreen(),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'lib/resources/weather_icons/02d.png',
        height: 400,
      ),
      title: Text(
        "Pogoda",
        style: TextStyle(
          fontSize: 26,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 25, 160, 224),
      showLoader: true,
      loaderColor: Colors.white,
      loadingText: Text(
        "Loading...",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      navigator: WeatherScreen(),
      durationInSeconds: 2,
    );
  }
}

// class SplashFuturePage extends StatefulWidget {
//   SplashFuturePage({Key? key}) : super(key: key);

//   @override
//   _SplashFuturePageState createState() => _SplashFuturePageState();
// }

// class _SplashFuturePageState extends State<SplashFuturePage> {
//   Future<Widget> futureCall() async {
//     // do async operation ( api call, auto login)
//     WeatherScreen();
//     return Future.value(new WeatherScreen());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return EasySplashScreen(
//       logo: Image.asset(
//         'lib/resources/weather_icons/02d.png',
//         height: 400,
//       ),
//       title: Text(
//         "Pogoda",
//         style: TextStyle(
//           fontSize: 26,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       backgroundColor: Color.fromARGB(255, 25, 160, 224),
//       showLoader: true,
//       loaderColor: Colors.white,
//       loadingText: Text(
//         "Loading...",
//         style: TextStyle(color: Colors.white, fontSize: 20),
//       ),
//       // navigator: WeatherScreen(),
//       durationInSeconds: 2,
//       futureNavigator: futureCall(),
//     );
//   }
// }
