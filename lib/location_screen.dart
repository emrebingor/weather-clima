import 'package:flutter/material.dart';
import 'package:weather_climate_flutter_app/constants.dart';
import 'package:weather_climate_flutter_app/weather.dart';
import 'constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();

  int? temperature;
  String? cityName;
  String? weatherMessage;
  String? weatherIcon;


  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }



  void updateUI(dynamic weatherData) {
    if (weatherData == null){
      temperature = 0;
      cityName = 'Not available';
      weatherMessage = 'Error!';
      weatherIcon = 'No Icon';
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    cityName = weatherData['name'];
    weatherMessage = weather.getMessage(temperature ?? 0);
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.near_me,
                    size: 50.0,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.location_city,
                    size: 50.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: <Widget>[
                  Text('15°', style: kTemperatureTextStyle),
                  Text('w', style: kCommentTextStyle),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                'Weather in Istanbul',
                textAlign: TextAlign.right,
                style: kWeatherinCity,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
