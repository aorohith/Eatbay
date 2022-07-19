import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final Completer<GoogleMapController> controller1 = Completer();

  List<Marker> markers = [initialMarker];

  double latitude = 0;
  double longitude = 0;


  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(9.79152, 76.746728),
    zoom: 14.4746,
  );

  static const Marker initialMarker = Marker(
    markerId: MarkerId('kGooglePlex'),
    infoWindow: InfoWindow(title: "Google Plex"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(9.791129, 76.746728),
  );

  Future getCurrentLocation() async {
    await getUserCurrentLocation().then((value) async {
      markers.add(
        Marker(
          markerId: const MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(title: "My current location"),
        ),
      );
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await controller1.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    });
    update();
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error');
    });
    Position position = await Geolocator.getCurrentPosition();
    longitude = position.longitude;
    latitude = position.latitude;
    return await Geolocator.getCurrentPosition();
  }

  getPlaceSuggesion() async {
    if (latitude != 0) {
      List<Placemark> placemark = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      return placemark;
    } else {
      Get.snackbar("Alert", "Please select current location");
    }
  }

  onTapMarker(LatLng latLng) {
    latitude = latLng.latitude;
    longitude = latLng.longitude;

    Marker newMarker = Marker(
      markerId: const MarkerId('new_marker'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(latitude,longitude),
    );
    markers.add(newMarker);
    print(markers.length);
    update();
  }
}
