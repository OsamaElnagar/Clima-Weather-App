
import 'location.dart';
import 'networking.dart';
const String apiKey = "b7eae2efeebfa383fe20e237f2053deb";
const String openWeatherMapKey = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future getCityWeather(String cityName) async {
    var url = '$openWeatherMapKey?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper =NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async
  {
    LocationClass location = LocationClass();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapKey?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey',
    );
    var weatherData = await networkHelper.getData();
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
      return "You'll need 🧣 and 🧤";
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}