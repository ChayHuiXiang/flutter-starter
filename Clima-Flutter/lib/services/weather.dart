import '../utilities/constants.dart';
import '../services/location.dart';
import '../services/networking.dart';

class WeatherModel {

  Future<Map> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    String latitude = location.latitude.toString();
    String longitude = location.longitude.toString();

    String urlString = 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    Uri url = Uri.parse(urlString);

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return networkHelper.getData();
  }

  Future<Map> getWeather(String cityName) async {
    String urlString = 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    Uri url = Uri.parse(urlString);

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return networkHelper.getData();

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
