import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MiddleWidget extends StatefulWidget {
  MiddleWidget({super.key, this.weather});
  Weather? weather;

  @override
  State<MiddleWidget> createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.fromLTRB(15, 16, 15, 32),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Szczegóły',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Icon(Icons.refresh),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailWidget(
                widgetIcon: Icons.wind_power,
                text1: 'Wiatr',
                // text2: '25 km/h',
                text2: widget.weather != null
                    ? '${(widget.weather!.windSpeed! * 3.6).round()} km/h'
                    : '',
              ),
              DetailWidget(
                widgetIcon: Icons.water_drop,
                text1: 'Wilgotność',
                // text2: '80 %',
                text2: widget.weather != null
                    ? '${widget.weather!.humidity!.round()} %'
                    : '',
              ),
              DetailWidget(
                widgetIcon: Icons.terrain,
                text1: 'Ciśnienie',
                // text2: '1027 hPa',
                text2: widget.weather != null
                    ? '${widget.weather!.pressure!.round()} hPa'
                    : '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  DetailWidget(
      {super.key,
      required this.widgetIcon,
      required this.text1,
      required this.text2,
      this.iconColor = Colors.blue,
      this.widgetText1Color = const Color.fromARGB(255, 75, 75, 75),
      this.widgetText2Color = Colors.black});

  IconData widgetIcon;
  Color iconColor;
  Color? widgetText1Color;
  Color? widgetText2Color;
  String? text1;
  String? text2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      // children: [
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widgetIcon,
            color: iconColor,
          ),
          const SizedBox(height: 5),
          Text(
            text1!,
            style: TextStyle(
              fontSize: 16,
              color: widgetText1Color,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            text2!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widgetText2Color,
            ),
          ),
        ],
      ),
      // ],
    );
  }
}
