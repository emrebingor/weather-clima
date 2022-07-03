import 'package:weather_climate_flutter_app/location.dart';
import 'package:weather_climate_flutter_app/networking.dart';

const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '91afe4743b14578be8bf0c28eb2dc1c9';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {

    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}
