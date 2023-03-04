import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({super.key, this.forecast});

  List<Weather>? forecast;
  List<String> weekdays = ['PON', 'WT', 'ŚR', 'CZw', 'PT', 'SOB', 'NDZ'];

// get forecast index of tommorow
  int findFirstForecastIndex() {
    int now = DateTime.now().weekday + 1;
    for (int i = 0; i <= 20; i++) {
      if (forecast![i].date?.weekday == now) {
        return i;
      }
    }
    return 0;
  }

  String? getForecastDate(Weather forecast) {
    NumberFormat dtFormatter = NumberFormat("00");
    return '${dtFormatter.format(forecast.date?.day).toString()}/${dtFormatter.format(forecast.date?.month).toString()}';
  }

  String? getForecastDay(Weather forecast) {
    return '${forecast.date?.day.toString()}/${forecast.date.toString()}';
  }

  String getWeatherImage(String? weatherIcon) {
    // if (weatherIcon != null) {
    return 'lib/resources/weather_icons/$weatherIcon.png';
    // } else {
    //   return 'lib/resources/weather_icons/02d.png';
    // }

    // return Image.asset('lib/resources/weather_icons/cloudy_sun.png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherForecastDay(
            // date: '12/02',
            date: forecast != null
                ? getForecastDate(forecast![findFirstForecastIndex() + 4])
                    .toString()
                : '',
            // day: 'NDZ',
            day: forecast != null
                ? weekdays[
                    (forecast![findFirstForecastIndex()].date?.weekday as int) -
                        1]
                : '',
            icon: forecast != null
                ? getWeatherImage(forecast![findFirstForecastIndex() + 4]
                    .weatherIcon
                    .toString())
                : 'lib/resources/weather_icons/empty.png',
            temperature: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 4].temperature.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
            tempMaxMin: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 2].tempMax.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°/${(int.parse(forecast![findFirstForecastIndex() + 6].tempMin.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
          ),
          WeatherForecastDay(
            // date: '12/02',
            date: forecast != null
                ? getForecastDate(forecast![findFirstForecastIndex() + 8])
                    .toString()
                : '',
            day: forecast != null
                ? weekdays[(forecast![findFirstForecastIndex() + 8]
                        .date
                        ?.weekday as int) -
                    1]
                : '',
            icon: forecast != null
                ? getWeatherImage(forecast![findFirstForecastIndex() + 12]
                    .weatherIcon
                    .toString())
                : 'lib/resources/weather_icons/empty.png',
            temperature: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 12].temperature.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
            tempMaxMin: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 10].tempMax.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°/${(int.parse(forecast![findFirstForecastIndex() + 14].tempMin.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
            colorType: true,
          ),
          WeatherForecastDay(
            // date: '12/02',
            date: forecast != null
                ? getForecastDate(forecast![findFirstForecastIndex() + 16])
                    .toString()
                : '',
            day: forecast != null
                ? weekdays[(forecast![findFirstForecastIndex() + 16]
                        .date
                        ?.weekday as int) -
                    1]
                : '',
            icon: forecast != null
                ? getWeatherImage(forecast![findFirstForecastIndex() + 20]
                    .weatherIcon
                    .toString())
                : 'lib/resources/weather_icons/empty.png',
            temperature: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 22].temperature.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
            tempMaxMin: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 20].tempMax.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°/${(int.parse(forecast![findFirstForecastIndex() + 24].tempMin.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
          ),
          WeatherForecastDay(
            // date: '12/02',
            date: forecast != null
                ? getForecastDate(forecast![findFirstForecastIndex() + 24])
                    .toString()
                : '',
            day: forecast != null
                ? weekdays[(forecast![findFirstForecastIndex() + 24]
                        .date
                        ?.weekday as int) -
                    1]
                : '',
            icon: forecast != null
                ? getWeatherImage(forecast![findFirstForecastIndex() + 28]
                    .weatherIcon
                    .toString())
                : 'lib/resources/weather_icons/empty.png',
            temperature: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 30].temperature.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
            tempMaxMin: forecast != null
                ? '${(int.parse(forecast![findFirstForecastIndex() + 28].tempMax.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°/${(int.parse(forecast![findFirstForecastIndex() + 30].tempMin.toString().replaceAll(RegExp(r'[^0-9]'), '').split(' ').first) / 10).round()}°'
                : '',
          ),
        ],
      ),
    );
  }
}

// Dq8%voD-5b
class WeatherForecastDay extends StatelessWidget {
  WeatherForecastDay(
      {super.key,
      required this.date,
      required this.day,
      required this.icon,
      required this.temperature,
      required this.tempMaxMin,
      this.indexColor = Colors.green,
      this.colorType = false});

  String day;
  String date;
  String icon;
  String temperature;
  String tempMaxMin;
  Color indexColor;
  bool colorType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: colorType == true
          ? BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 25, 224, 194),
                  // Color.fromARGB(255, 125, 184, 194),
                  Color.fromARGB(255, 25, 160, 224),
                  Color.fromARGB(255, 125, 120, 245),
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
            )
          : null,
      width: 70,
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorType == true ? Colors.white : Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorType == true
                    ? Colors.white
                    : const Color.fromARGB(255, 68, 68, 68)),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            icon,
            height: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            temperature,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorType == true ? Colors.white : Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            tempMaxMin,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorType == true ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
