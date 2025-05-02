import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String?> getCityFromCurrentLocation() async {
  bool servicesEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  servicesEnabled = await Geolocator.isLocationServiceEnabled();
  if (!servicesEnabled) {
    return Future.error('Location services are disabled. Please enable them.');
  }

  // Check and request location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied.');
    }
  }
  
  // If permission is granted, proceed to get location
  if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
    Position position = await Geolocator.getCurrentPosition();
    
    // Reverse geocode to get the city name from the coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      log('City: ${place.locality}');
      return place.locality;  // Return the city name
    } else {
      return Future.error('Unable to get the city name.');
    }
  } else {
    return Future.error('Location permission is not granted.');
  }
}
