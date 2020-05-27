import 'package:flutterweatherapp/services/location.dart';
import 'networking.dart';

const apiKey = '8b270f61b3c21e4640352292a0dc674a';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    print('weather.dart : $url');
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    print('weather.dart : $weatherData');
    return weatherData;
  }

  // get weather according to a location
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    /* We can only await for methods that return Future.Therefore return type
     of getCurrentLocation() method is Future*/
    await location.getCurrentLocation();
    print('lat1 : ${location.latitude}');
    print('long1 : ${location.longitude}');
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    print('Weather : $weatherData');
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
