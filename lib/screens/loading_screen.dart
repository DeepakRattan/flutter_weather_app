import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterweatherapp/screens/location_screen.dart';
import 'package:flutterweatherapp/services/location.dart';
import 'package:flutterweatherapp/services/networking.dart';
import 'package:flutterweatherapp/services/weather.dart';
import 'package:http/http.dart' as http;

const loading_screen = 'Loading Screen';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  // initState() method is triggered as soon as our stateful widget gets created.
  // initState() method only gets called once when out State gets initialized and gets created .

  @override
  void initState() {
    super.initState();
    // As soon as the screen is loaded,we get the latitude and longitude of current location
    getLocationData();
  }

  // Get current location
  /* async : Any functions we want to run asynchronously need to have the async modifier
   added to it.Typically, the function you want to run asynchronously would have some
   expensive operation in it like file I/O (an API call to a RESTful service)or some
   sort of more common computation.*/

  /* await : The await part basically says - go ahead and run this function asynchronously
  and, when it is done, continue on to the next line of code. */

  void getLocationData() async {
    /* getLocationWeather() method returns a FUTURE .So it can be completed in any time.
    But we need to use the result of this inside variable weatherData .So we are using
    await keyword for geLocation() method .
     */
    var weatherData = await WeatherModel().getLocationWeather();
    print('$loading_screen : $weatherData');
    //Navigate to LocationScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData);
        },
      ),
    );
  }

  /*void getData() async {
    // we will wait for the response of get before print statement will work
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      String res = response.body;
      print('Response Body : $res');
      // Json parsing
      var decodeData = jsonDecode(res);
      var longitude = decodeData['coord']['lon'];
      print(longitude);
      var weatherDescription = decodeData['weather'][0]['description'];
      print('Weather description : $weatherDescription');

      var temp = decodeData['main']['temp'];
      print('Temp : $temp');

      var id = decodeData['weather'][0]['id'];
      print('id : $id');

      var name = decodeData['name'];
      print('city name : $name');
    } else {
      print('Response Code :  ${response.statusCode}');
    }
  }*/

  // 2 . build method calls every time , our widgets rebuild .
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Loading indicator
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
