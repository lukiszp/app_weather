import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather/weather.dart';

// ignore: must_be_immutable
class TopWidget extends StatelessWidget {
  TopWidget({
    super.key,
    this.weather,
  });

  Weather? weather;

  String getWeatherImage(String? weatherIcon) {
    return 'lib/resources/icons/$weatherIcon.png';
    // return 'lib/resources/icons/01d.png';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.red,
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 224, 194),
                Color.fromARGB(255, 25, 160, 224),
                Color.fromARGB(255, 125, 120, 245),
                // Color.fromARGB(255, 0, 224, 194),
                // Color.fromARGB(255, 0, 160, 224),
                // Color.fromARGB(255, 0, 140, 234),
                // Color.fromARGB(255, 0, 120, 245),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GradientText(
                    // '28°',
                    weather != null
                        ? '${(int.parse(weather!.temperature.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                        : '?°',
                    style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ttb,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.2),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Reda',
                        weather != null
                            ? '${weather!.areaName.toString()}, ${weather!.country.toString()} '
                            : 'Loading',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        // 'Sobota, 11/02/23',
                        // weather != null
                        //     ? weather!.date.toString().split(' ').first
                        //     : 'Loading',
                        weather != null
                            ? weather!.weatherDescription.toString()
                            // .split(' ')
                            // .first
                            : 'Loading',
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Icon(
                    Icons.air,
                    size: 80,
                    color: Colors.white.withOpacity(0.25),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          // left: 32,
          left: 42,
          top: -20,
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              // width: 200,
              // height: 250,
              // child: Image.network(
              //     'https://freepngimg.com/thumb/categories/2275.png'),
              width: 200,
              height: 220,
              // child: Image.asset('lib/resources/icons/cloudy_sun.png'),
              child: Image.asset(weather != null
                  ? getWeatherImage(weather!.weatherIcon)
                  : 'lib/resources/icons/02d.png'),
              // child: Image.network(
              //   weather != null
              //       ? 'http://openweathermap.org/img/wn/${weather!.weatherIcon.toString()}@2x.png'
              //       : '?',
              // style: TextStyle(color: Colors.black),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
