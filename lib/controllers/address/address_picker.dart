import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay/models/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPickerController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;

  bool isLoading = false;

  final Completer<GoogleMapController> controller1 = Completer();

  List<Marker> markers = [initialMarker];

  double latitude = 0;
  double longitude = 0;
  

  TextEditingController searchController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


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
      position: LatLng(latitude, longitude),
    );
    markers.add(newMarker);
    print(markers.length);
    update();
  }

  addAddress() async {
    AddressModel address = AddressModel(
      address: addressController.text.trim(),
      contactPerson: contactPersonController.text.trim(),
      phone: phoneController.text.trim(),
      userId: FirebaseAuth.instance.currentUser!.uid,
      longitude: longitude.toString(),
      latitude: latitude.toString(),
    );
    final doc = firebaseInstance.collection('addresses').doc();
    address.id = doc.id;
    final json = address.toJson();
    await doc.set(json);
    Get.back();
    Get.snackbar("title", "Address added successfully");
  }
}
