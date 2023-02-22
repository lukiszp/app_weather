import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class SearchWeatherBar extends StatelessWidget {
  SearchWeatherBar({super.key, this.weather, this.notifyParent});

  Weather? weather;
  TextEditingController? manualLocation;
  // final ValueChanged<bool>? onChanged;
  final Function()? notifyParent;
  // final bool active;

  // void _handleTap() {
  //   // onChanged!(!active);
  // }

  String? locationFromSearchBar() {
    return manualLocation.toString();
  }

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
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
            width: 300,
            // child: Placeholder(),
            child: TextField(
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                // border: OutlineInputBorder(),
                border: InputBorder.none,
                // hintText: 'Testowy',
                hintText:
                    weather != null ? weather!.areaName.toString() : 'Loading',
              ),
              controller: manualLocation,
              // onChanged: (value) => _handleTap,
            ),
          ),
          ElevatedButton(
            onPressed: () => notifyParent,
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
