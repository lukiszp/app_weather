import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather/weather_detail_widgets/weather_detail_widgets.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({
    super.key,
  });

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
                text2: '25 km/h',
              ),
              DetailWidget(
                widgetIcon: Icons.thermostat,
                text1: 'Odczuwalne',
                text2: '31°',
              ),
              DetailWidget(
                widgetIcon: Icons.terrain,
                text1: 'Ciśnienie',
                text2: '1027 hPa',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DetailWidget(
                widgetIcon: Icons.home,
                text1: 'Widoczność',
                text2: '11 km',
              ),
              DetailWidget(
                widgetIcon: Icons.sunny,
                text1: 'Indeks UV',
                text2: 'Małe, 0',
              ),
              DetailWidget(
                widgetIcon: Icons.water,
                text1: 'Wilgotność',
                text2: '80 %',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
