import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover
          ),
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
