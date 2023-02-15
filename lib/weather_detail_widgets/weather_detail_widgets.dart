import 'package:flutter/material.dart';

class Detail1 extends StatelessWidget {
  const Detail1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.wind_power,
          color: Color.fromARGB(255, 128, 132, 134),
        ),
        SizedBox(height: 5),
        Text(
          'tekst1',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 1),
        Text(
          'test2',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Detail2 extends StatelessWidget {
  const Detail2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.wind_power,
          color: Color.fromARGB(255, 128, 132, 134),
        ),
        SizedBox(height: 5),
        Text(
          'tekst1',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 1),
        Text(
          'test2',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Detail3 extends StatelessWidget {
  const Detail3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.wind_power,
          color: Color.fromARGB(255, 128, 132, 134),
        ),
        SizedBox(height: 5),
        Text(
          'tekst1',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 1),
        Text(
          'test2',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Detail4 extends StatelessWidget {
  const Detail4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.wind_power,
          color: Color.fromARGB(255, 128, 132, 134),
        ),
        SizedBox(height: 5),
        Text(
          'tekst1',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 1),
        Text(
          'test2',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Detail5 extends StatelessWidget {
  const Detail5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.wind_power,
          color: Color.fromARGB(255, 128, 132, 134),
        ),
        SizedBox(height: 5),
        Text(
          'tekst1',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 1),
        Text(
          'test2',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Detail6 extends StatelessWidget {
  const Detail6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.wind_power,
          color: Color.fromARGB(255, 128, 132, 134),
        ),
        SizedBox(height: 5),
        Text(
          'tekst1',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 1),
        Text(
          'test2',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DetailBox1 extends StatelessWidget {
  const DetailBox1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Detail1(),
        Detail1(),
        Detail1(),
      ],
    );
  }
}

class DetailBox2 extends StatelessWidget {
  const DetailBox2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Detail4(),
        Detail5(),
        Detail6(),
      ],
    );
  }
}
