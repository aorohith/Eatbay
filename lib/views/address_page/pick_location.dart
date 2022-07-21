import 'package:eatbay/controllers/address/address_picker_controller.dart';
import 'package:eatbay/views/address_page/widgets/address_trigger_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends StatelessWidget {
  PickLocationScreen({Key? key}) : super(key: key);

  final addressController = Get.put(AddressPickerController());
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
                zoomControlsEnabled: false,
                myLocationEnabled: true,
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
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

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
            AddressTriggerButton(
              onClick: () async {
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
                    ),
                  ),
                );
              },
              text: 'Enter Complete Addresses',
            ),
          ],
        ),
      ),
    );
  }

  ListView placeListTile(List<Placemark> placemark) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          addressController.addAddress();
          Get.back();
        },
        child: Card(
          child: ListTile(
            onTap: () {
              String? address =
                  "${placemark[index].name}, ${placemark[index].street}, ${placemark[index].locality}";
              addressController.addressController.text = address;
              Get.back();
              addressBottomSheet();
            },
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
