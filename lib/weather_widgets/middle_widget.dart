import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/weather_detail_widgets/weather_detail_widgets.dart';

class MiddleWidget extends StatelessWidget {
  MiddleWidget({super.key, this.weather});
  Weather? weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.fromLTRB(25, 16, 25, 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Szczegóły',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.refresh),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DetailWidget(
                widgetIcon: Icons.wind_power,
                text1: 'Wiatr',
                // text2: '25 km/h',
                text2:
                    weather != null ? '${weather!.windSpeed} m/s' : 'Loading',
              ),
              DetailWidget(
                widgetIcon: Icons.thermostat,
                text1: 'Odczuwalne',
                // text2: '31°',
                text2: weather != null
                    ? '${weather!.tempFeelsLike.toString()[0]}${weather!.tempFeelsLike.toString()[1]}${weather!.tempFeelsLike.toString()[2]} °'
                    : 'Loading',
              ),
              DetailWidget(
                widgetIcon: Icons.terrain,
                text1: 'Ciśnienie',
                // text2: '1027 hPa',
                text2:
                    weather != null ? weather!.pressure.toString() : 'Loading',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DetailWidget(
                widgetIcon: Icons.thermostat,
                text1: 'Temp min',
                // text2: '11 km',
                text2: weather != null
                    ? '${weather!.tempMin.toString()[0]}${weather!.tempMin.toString()[1]}${weather!.tempMin.toString()[2]} °'
                    : 'Loading',
              ),
              DetailWidget(
                widgetIcon: Icons.water_drop,
                text1: 'Deszcz 1h',
                // text2: 'Małe, 0',
                text2:
                    weather != null ? '${weather!.rainLastHour} mm' : 'Loading',
              ),
              DetailWidget(
                widgetIcon: Icons.water,
                text1: 'Wilgotność',
                // text2: '80 %',
                text2: weather != null ? '${weather!.humidity} %' : 'Loading',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
