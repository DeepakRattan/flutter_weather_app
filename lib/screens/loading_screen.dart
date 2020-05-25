import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // Get current location
  /* async : Any functions we want to run asynchronously need to have the async modifier
   added to it.Typically, the function you want to run asynchronously would have some
   expensive operation in it like file I/O (an API call to a RESTful service)or some
   sort of more common computation.*/

  /* await : The await part basically says - go ahead and run this function asynchronously
  and, when it is done, continue on to the next line of code. */

  void getLocation() async {
    // To query the current location of the device simply make a call to the
    // getCurrentPosition method:
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
