import 'package:weather_climate_flutter_app/location.dart';
import 'package:weather_climate_flutter_app/networking.dart';

const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '91afe4743b14578be8bf0c28eb2dc1c9';

class WeatherModel {


  Future<dynamic> getCityWeather(String cityName) async {

    NetworkHelper networkHelper = NetworkHelper('$weatherUrl?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {

    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String? getWeatherIcon(int condition){
    if(condition < 300){
      return '๐ฉ';
    } else if (condition < 400){
      return '๐ฉ';
    } else if (condition < 500){
      return '๐ง';
    } else if (condition < 600){
      return 'โ๏ธ';
    } else if (condition < 700){
      return 'โ๏ธ';
    } else if (condition < 800){
      return '๐ซ';
    } else if (condition == 800){
      return 'โ๏ธ';
    } else if (condition <= 804){
      return 'โ๏ธ';
    } else {
      return '๐คท';
    }
  }

  String? getMessage(int temp){
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}


