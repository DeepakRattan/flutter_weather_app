import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
/* To query the current location of the device simply make a call to the
    getCurrentPosition method which is asynchronous .
    We have added async keyword to getLocation() method because it give access to await keyword
    which says wait until this completes before we continue doing anything .
    */
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
