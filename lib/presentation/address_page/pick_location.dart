import 'package:eatbay/core/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/icon_text_filed.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
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
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.location_on),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search Here",
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.location_on,
              size: 50,
              color: Colors.red,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Pick Address',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
