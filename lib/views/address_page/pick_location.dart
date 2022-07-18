import 'package:eatbay/models/services/locatio_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class PickLocationScreen extends StatefulWidget {
  @override
  State<PickLocationScreen> createState() => PickLocationScreenState();
}

class PickLocationScreenState extends State<PickLocationScreen> {
  TextEditingController _searchController = TextEditingController();

  Completer<GoogleMapController> _controller = Completer();

  var _markers = {_kGooglePlexMarker, _kLakeMarker};

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final Marker _kGooglePlexMarker = const Marker(
    markerId: MarkerId('kGooglePlex'),
    infoWindow: InfoWindow(title: "Google Plex"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );

  static final Marker _kLakeMarker = Marker(
    markerId: const MarkerId('kLakeMarker'),
    infoWindow: const InfoWindow(title: "Lake Marker"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: const LatLng(37.43296265331129, -122.08832357078792),
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // static final Polyline _kPolyline = const Polyline(
  //     polylineId: PolylineId('_kPolyline'),
  //     points: [
  //        LatLng(37.42796133580664, -122.085749655962),
  //       LatLng(37.43296265331129, -122.08832357078792),
  //     ],
  //     width: 5);

  // static final Polygon _kPolygon = Polygon(
  //   polygonId: PolygonId('_kPolygon'),
  //   points: [
  //       LatLng(37.43296265331129, -122.08832357078792),
  //       LatLng(37.418, -122.092),
  //       LatLng(37.435, -122.092),
  //   ],
  //   strokeWidth: 5,
  //   fillColor: Colors.transparent
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            // polylines: {_kPolyline},
            // polygons: {_kPolygon},
          ),
          search(),
          bottomButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await getUserCurrentLocation().then((value) async {
            print(value.latitude);
            print(value.longitude);
            _markers.add(Marker(
                markerId: MarkerId('2'),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: "My current location")));
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );
            final GoogleMapController controller = await _controller.future;

            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          });
          setState(() {
            
          });
        },
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  Align bottomButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Pick Address',
            ),
          ),
        ),
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.8),
        ),
        child: SizedBox(
          height: 70,
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.location_on),
              suffixIcon: IconButton(
                onPressed: () {
                  LocationService().getPlaceId(_searchController.text);
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Search Here",
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error');
    });
    return await Geolocator.getCurrentPosition();
  }

  // Container bgBackground() {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       image: DecorationImage(
  //         image: NetworkImage(
  //           "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
  //         ),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }
}
