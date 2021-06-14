import 'package:clima_hv/services/location.dart';
import 'package:clima_hv/services/networking.dart';

const httpAPIKey = 'a2a133d1df75027f2bdbfccfc5cd2e3f';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/find';

class WeatherModel {
  //!get city
   Future<dynamic> getCityWeather(String cityName) async {
      var url = Uri.parse( '$openWeatherMapURL?q=$cityName&appid=$httpAPIKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);
       

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  //!get location
 Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

   var url = Uri.parse('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$httpAPIKey&units=metric');
   

    NetworkHelper networkHelper = NetworkHelper(url);

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
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
