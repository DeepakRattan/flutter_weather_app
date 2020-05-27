import 'package:flutter/material.dart';
import 'package:flutterweatherapp/screens/city_screen.dart';
import 'package:flutterweatherapp/services/weather.dart';
import 'package:flutterweatherapp/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen(this.locationWeather);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

/* State object knows which stateful widget it belongs to.
*  State object has a property named "widget" which points to its parent stateful widget .*/
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = new WeatherModel();
  int temperature;
  String cityName;
  //int condition;
  String weatherIcon;
  String weatherMessage;
  @override
  void initState() {
    super.initState();
    // Accessing locationWeather data of Location screen from LocationScreenState
    // We can access widget object inside every single state object
    print(widget.locationWeather);
    updateUI(widget.locationWeather);
  }

  void updateUI(var weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return; // Exit from the method
      } else {
        dynamic temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getMessage(temperature);
        cityName = weatherData['name'];
        print(temperature);
      }
    });
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
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      // Return type of Push is Future and that value comes when we navigate back
                      // from another screen to this screen .In our code,when we navigate back from
                      // City screen to Location screen ,we get the value
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      print('city : $typedName');
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        print('location screen : $weatherData');
                        updateUI(weatherData);
                      }
                    },
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
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Center(
                    child: Text(
                      "$weatherMessage in $cityName",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
