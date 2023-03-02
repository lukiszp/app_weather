import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/weather_widgets/top_widget.dart';
import 'package:weather_app/weather_widgets/middle_widget.dart';
import 'package:weather_app/weather_widgets/bottom_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherFactory wf = WeatherFactory("3c6dcd53aca5a6a0a34ab6ffdb8699cd",
      language: Language.POLISH);
  Weather? weather;
  List<Weather>? forecast;
  bool locationType = false;

  String? manualLocation;
  var searchBarController = TextEditingController();
  String? hintText;

  // final RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  // void _onRefresh() async {
  //   // monitor network fetch
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   // if failed,use refreshFailed()
  //   _refreshController.refreshCompleted();
  // }

  void refreshCity() async {
    setState(() {
      if (manualLocation != null) {
        getWeatherByCityName();
        // manualLocation = null;
        searchBarController.clear();
      }
    });
  }

  void refreshLocation() async {
    setState(() {
      searchBarController.clear();
      // weather = null;
      manualLocation = null;
      getWeatherByLocation();
    });
  }

  @override
  void initState() {
    super.initState();
    getWeatherByLocation();
    // refresh();
  }

  Future<void> getWeatherByCityName() async {
    Weather? newWeather;

    if (manualLocation != null && manualLocation != 'Loading') {
      newWeather = await wf.currentWeatherByCityName(manualLocation!);
      forecast = await wf.fiveDayForecastByCityName(manualLocation!);
    }

    setState(() {
      weather = newWeather;
      hintText = weather!.areaName.toString();
    });
  }

  Future<void> getWeatherByLocation() async {
    Weather? newWeather;

    // if (manualLocation != null && manualLocation != 'Loading') {
    //   newWeather = await wf.currentWeatherByCityName(manualLocation!);
    // } else {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    newWeather = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);
    forecast = await wf.fiveDayForecastByLocation(
        position.latitude, position.longitude);
    // }

    setState(() {
      weather = newWeather;
      hintText = weather!.areaName.toString();
    });
  }

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
              const SizedBox(
                height: 0,
              ),
              // SearchWeatherBar(
              //   weather: weather,
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.search),
                    SizedBox(
                      height: 50,
                      width: 220,
                      // child: Placeholder(),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          hintText: hintText,
                        ),
                        controller: searchBarController,
                        onChanged: (value) {
                          manualLocation = value.toString();
                        },
                        onSubmitted: (value) {
                          refreshCity();
                        },
                        onTap: () {
                          setState(() {
                            hintText = "Wpisz lokalizację";
                          });
                        },

                        // onChanged: (value) => _handleTap,
                      ),
                    ),
                    IconButton(
                      onPressed: refreshLocation,
                      // child: null,
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              TopWidget(
                weather: weather,
              ),
              MiddleWidget(
                weather: weather,
              ),
              BottomWidget(
                forecast: forecast,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
