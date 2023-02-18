import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherFutureOtherDays(
            date: '12/02',
            day: 'NDZ',
            icon:
                'https://www.pngall.com/wp-content/uploads/11/Weather-PNG-HD-Image.png',
            temperature: '28°',
          ),
          WeatherFutureTommorow(
            date: '13/02',
            day: 'PON',
            icon: 'https://freepngimg.com/thumb/categories/2275.png',
            temperature: '23°',
          ),
          WeatherFutureOtherDays(
            date: '14/02',
            day: 'WT',
            icon:
                'https://www.transparentpng.com/thumb/weather/png-photo-weather-hd-9.png',
            temperature: '31°',
          ),
          WeatherFutureOtherDays(
            date: '15/02',
            day: 'ŚR',
            icon:
                'https://www.pngall.com/wp-content/uploads/11/Weather-PNG-HD-Image.png',
            temperature: '33°',
          ),
        ],
      ),
    );
  }
}

class WeatherFutureTommorow extends StatelessWidget {
  WeatherFutureTommorow(
      {super.key,
      required this.date,
      required this.day,
      required this.icon,
      required this.temperature,
      this.indexColor = const Color.fromARGB(255, 212, 199, 6)});

  String day;
  String date;
  String icon;
  String temperature;
  Color indexColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 224, 194),
            Color.fromARGB(255, 0, 184, 194),
            Color.fromARGB(255, 0, 120, 245),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      width: 70,
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.network(icon),
          Text(
            temperature,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadius.all(Radius.circular(5)),
          //     color: indexColor,
          //   ),
          //   child: const SizedBox(
          //     width: 35,
          //     height: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}

// Dq8%voD-5b
class WeatherFutureOtherDays extends StatelessWidget {
  WeatherFutureOtherDays(
      {super.key,
      required this.date,
      required this.day,
      required this.icon,
      required this.temperature,
      this.indexColor = Colors.green});

  String day;
  String date;
  String icon;
  String temperature;
  Color indexColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 68, 68)),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.network(icon),
          Text(
            temperature,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
