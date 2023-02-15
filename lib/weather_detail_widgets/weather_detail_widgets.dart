import 'package:flutter/material.dart';

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
  String text1;
  String text2;

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
            text1,
            style: TextStyle(
              fontSize: 16,
              color: widgetText1Color,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            text2,
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

// class DetailRow extends StatelessWidget {
//   const DetailRow({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         DetailWidget(
//           widgetIcon: Icons.wind_power,
//           text1: 'Wiatr',
//           text2: '25 km/h',
//         ),
//         DetailWidget(
//           widgetIcon: Icons.wind_power,
//           text1: 'Punkt rosy',
//           text2: 'Mały',
//         ),
//         DetailWidget(
//           widgetIcon: Icons.wind_power,
//           text1: 'Ciśnienie',
//           text2: '1027 hPa',
//         ),
//       ],
//     );
//   }
// }
