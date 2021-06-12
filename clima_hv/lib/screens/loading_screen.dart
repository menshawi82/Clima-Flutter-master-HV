import 'package:clima_hv/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
   await location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    try {
      String myMargin = '15';
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(double.parse(myMargin)),
          color: Colors.green,
        ),
      );
    } catch (e) {
      return Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(child: Text(e.toString())),
        ),
      );
    }
  }
}
