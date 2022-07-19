import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final Completer<GoogleMapController> controller1 = Completer();

  final Set<Marker> markers = {kGooglePlexMarker};

  Position position = Position(
    longitude: 9.79152,
    latitude: 76.746728,
    timestamp: DateTime.now(),
    accuracy: 10,
    altitude: 10,
    heading: 10,
    speed: 10,
    speedAccuracy: 10,
  );

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(9.79152, 76.746728),
    zoom: 14.4746,
  );

  static const Marker kGooglePlexMarker = Marker(
    markerId: MarkerId('kGooglePlex'),
    infoWindow: InfoWindow(title: "Google Plex"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(9.791129, 76.746728),
  );

  Future getCurrentLocation() async {
    await getUserCurrentLocation().then((value) async {
      position = value;
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
    return await Geolocator.getCurrentPosition();
  }

  getPlaceSuggesion() async {
    if (position.speed != 10) {
      List<Placemark> placemark = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Get.defaultDialog(
        title: "Select Address",
        content: Container(
          height: 300,
          width: 300,
            child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(placemark[index].name.toString()),
                    subtitle: Text(placemark[index].locality.toString()),
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: placemark.length,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Just Select Location"),
              ),
            )
          ],
        )),
      );
    } else {
      Get.snackbar("Alert", "Please select current location");
    }
  }
}
