import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // initState() method is triggered as soon as our stateful widget gets created.
  // initState() method only gets called once when out State gets initialized and gets created .

  @override
  void initState() {
    super.initState();
    // As soon as the screen is loaded,we get the latitude and longitude of current location
    getLocation();
  }

  // Get current location
  /* async : Any functions we want to run asynchronously need to have the async modifier
   added to it.Typically, the function you want to run asynchronously would have some
   expensive operation in it like file I/O (an API call to a RESTful service)or some
   sort of more common computation.*/

  /* await : The await part basically says - go ahead and run this function asynchronously
  and, when it is done, continue on to the next line of code. */

  void getLocation() async {
    /* To query the current location of the device simply make a call to the
    getCurrentPosition method which is asynchronous .
    We have added async keyword to getLocation() method because it give access to await keyword
    which says wait until this completes before we continue doing anything .

    */
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  // 2 . build method calls every time , our widgets rebuild .
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
