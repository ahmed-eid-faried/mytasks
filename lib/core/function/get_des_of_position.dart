// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:mytasks/core/class/status_request.dart';

// class LocationMap {
//   // Get the address (Placemark) of a given LatLng
//   Future<Placemark> getDesOfPosition(LatLng latlng) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
//     return placemarks.isNotEmpty ? placemarks[0] : Placemark();
//   }

//   // Get the address (Placemark) of the current device position
//   Future<Placemark> getDesOfCurrentPosition() async {
//     Position xy = await Geolocator.getCurrentPosition();
//     return getDesOfPosition(LatLng(xy.latitude, xy.longitude));
//   }

//   // Check if location services are enabled
//   Future<bool> check(StatusRequest? statusRequest) async {
//     bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!isLocationServiceEnabled) {
//       if (statusRequest != null) {
//         statusRequest = StatusRequest.offlinefailure;
//       }
//       Get.defaultDialog(
//         title: 'Check your Location services',
//         middleText: "Location services are disabled.",
//       );
//     }
//     await checkPermission(statusRequest);
//     return isLocationServiceEnabled;
//   }

//   // Check and request location permissions if needed
//   Future<LocationPermission> checkPermission(
//       StatusRequest? statusRequest) async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     print(permission);

//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       if (statusRequest != null) {
//         statusRequest = StatusRequest.offlinefailure;
//       }
//       await Geolocator.requestPermission();
//     }
//     return permission;
//   }

//   // Get the current device position (latitude and longitude)
//   Future<LatLng> getPositionLatLng() async {
//     Position xy = await Geolocator.getCurrentPosition();
//     return LatLng(xy.latitude, xy.longitude);
//   }

//   // Measure the distance between the device's location and a specified point
//   Future<double> measureDistance(double px, double py) async {
//     Position xy = await Geolocator.getCurrentPosition();
//     var distanceBetween =
//         Geolocator.distanceBetween(xy.latitude, xy.longitude, px, py) / 1000;
//     Get.defaultDialog(
//         title: 'Distance between two points',
//         middleText:
//             "The distance between your location and point ($px, $py) is approximately $distanceBetween kilometers.");
//     return distanceBetween;
//   }
// }
