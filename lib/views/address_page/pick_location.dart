import 'package:eatbay/controllers/address/address_picker.dart';
import 'package:eatbay/views/address_page/widgets/address_trigger_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({Key? key}) : super(key: key);
  @override
  State<PickLocationScreen> createState() => PickLocationScreenState();
}

class PickLocationScreenState extends State<PickLocationScreen> {
  final addressController = Get.put(AddressPickerController());

  // static final Marker _kLakeMarker = Marker(
  //   markerId: const MarkerId('kLakeMarker'),
  //   infoWindow: const InfoWindow(title: "Lake Marker"),
  //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //   position: const LatLng(9.791129, 76.746728),
  // );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

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
    return GetBuilder<AddressPickerController>(
      init: AddressPickerController(),
      builder: (addressController) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              GoogleMap(
                markers: Set.from(addressController.markers),
                mapType: MapType.normal,
                initialCameraPosition: addressController.kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  addressController.controller1.complete(controller);
                },
                onTap: (LatLng latLng) {
                  addressController.onTapMarker(latLng);
                },
                // polylines: {_kPolyline},
                // polygons: {_kPolygon},
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
              search(),
              currentLocation(),
              bottomSection(),
            ],
          ),
        );
      },
    );
  }

  currentLocation() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 120.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.white.withOpacity(0.9),
            side: const BorderSide(color: Colors.red),
            shadowColor: Colors.transparent,
          ),
          onPressed: () async {
            await addressController.getCurrentLocation();
          },
          icon: const Icon(
            Icons.my_location,
            color: Colors.red,
          ),
          label: const Text(
            "Use Current Location",
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  Align bottomSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                var placemark = await addressController.getPlaceSuggesion();
                Get.defaultDialog(
                  title: "Select Address",
                  content: SizedBox(
                      height: 300,
                      width: 300,
                      child: Column(
                        children: [
                          Expanded(
                            child: placeListTile(placemark),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Just Select Location"),
                            ),
                          )
                        ],
                      )),
                );
              },
              child: const Text("Select Place"),
            ),
            AddressTriggerButton(
              onClick: () {
                addressBottomSheet();
              },
              text: 'Enter Complete Addresses',
            ),
          ],
        ),
      ),
    );
  }

  ListView placeListTile(placemark) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          addressController.addAddress();
          Get.back();
        },
        child: Card(
          child: ListTile(
            title: Text(placemark[index].name.toString()),
            subtitle: Text(placemark[index].locality.toString()),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: placemark.length,
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
            controller: addressController.searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.location_on),
              suffixIcon: IconButton(
                onPressed: () {
                  // LocationService().getPlaceId(_searchController.text);
                },
                icon: const Icon(
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
}
