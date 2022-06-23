import 'package:flutter/material.dart';

import '../core/dimensions.dart';

class DetailImageSection extends StatelessWidget {
  const DetailImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.red,
          height: Dimensions.screenHeight,
          child: Column(
            children: [
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://www.hungryforever.com/wp-content/uploads/2015/11/feature-image-gulab-jamun-1280x720.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        );
  }
}
