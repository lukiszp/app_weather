import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.red,
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 224, 194),
                Color.fromARGB(255, 0, 160, 224),
                Color.fromARGB(255, 0, 140, 234),
                Color.fromARGB(255, 0, 120, 245),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
          margin: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GradientText(
                    '28°',
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
                    children: const [
                      Text(
                        'Reda',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sobota, 11/02/23',
                        style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
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
          left: 32,
          top: -32,
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 200,
              height: 250,
              child: Image.network(
                  'https://freepngimg.com/thumb/categories/2275.png'),
            ),
          ),
        ),
      ],
    );
  }
}
