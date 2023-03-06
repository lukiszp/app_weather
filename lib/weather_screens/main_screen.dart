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
  String? currentLocation;
  bool? serviceEnabled;

  var searchBarController = TextEditingController();
  String? hintText;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(manualLocation != null
        ? Duration(milliseconds: 100)
        : Duration(milliseconds: 3000));
    refreshCity();
    _refreshController.refreshCompleted();
  }

  void refreshCity() async {
    setState(() {
      if (manualLocation != null) {
        currentLocation = manualLocation;
        _refreshController.requestRefresh();
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
      currentLocation = manualLocation;
      manualLocation = null;
      _refreshController.requestRefresh();
      getWeatherByLocation();
    });
  }

  @override
  void initState() {
    super.initState();
    // _determinePosition();

    getWeatherByLocation();
    // refresh();
  }

  Future<Position> getPosition() async {
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Get.snackbar('', 'Location Permission Denied');

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getWeatherByCityName() async {
    Weather? newWeather;

    if (manualLocation != null && manualLocation != 'Loading') {
      newWeather = await wf.currentWeatherByCityName(currentLocation!);
      forecast = await wf.fiveDayForecastByCityName(currentLocation!);
    }

    setState(() {
      weather = newWeather;
      hintText = weather!.areaName.toString();
    });
  }

  Future<void> getWeatherByLocation() async {
    Weather? newWeather;

    // Position position = await Geolocator.getCurrentPosition();
    Position position = await getPosition();

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
        child: SmartRefresher(
          header: const ClassicHeader(
            idleText: "Przeciągnij w dół aby odświeżyć",
            releaseText: "Odśwież",
            refreshingText: "Wczytywanie",
            completeText: "Wykonano",
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 235, 233, 233),
                  Color.fromARGB(255, 196, 196, 196),
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
                        offset:
                            const Offset(4, 4), // changes position of shadow
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
                        ),
                      ),
                      IconButton(
                        onPressed: refreshLocation,
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                weather != null
                    ? TopWidget(
                        weather: weather,
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                weather != null
                    ? MiddleWidget(
                        weather: weather,
                      )
                    : AlertDialog(),
                weather != null
                    ? BottomWidget(
                        forecast: forecast,
                      )
                    : AlertDialog(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
