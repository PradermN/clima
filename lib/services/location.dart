import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {

      // // Check permission status
      // LocationPermission permission = await Geolocator.checkPermission();
      // // Request permission if not granted
      // if (permission == LocationPermission.denied) {
      //   permission = await Geolocator.requestPermission();
      //   if (permission == LocationPermission.denied) {
      //     print('Location permission denied');
      //     return;
      //   }
      // }
      // // If permission is permanently denied, show error
      // if (permission == LocationPermission.deniedForever) {
      //   print('Location permission permanently denied');
      //   return;
      // }

      // Get the position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.low),
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}
