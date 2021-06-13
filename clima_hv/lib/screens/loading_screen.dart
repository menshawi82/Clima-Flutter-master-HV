import 'package:clima_hv/screens/location_screen.dart';
import 'package:clima_hv/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima_hv/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String httpAPIKey = 'a2a133d1df75027f2bdbfccfc5cd2e3f';
  double latitude;
  double longitude;
  var url;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    
    url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/find?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$httpAPIKey'
        // 'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$httpAPIKey'//for test
        );
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
