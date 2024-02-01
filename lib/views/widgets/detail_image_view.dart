import 'package:eatbay/models/product_model.dart';
import 'package:eatbay/views/core/dimensions.dart';
import 'package:flutter/material.dart';

class DetailImageSection extends StatelessWidget {
    final Product product;
 const  DetailImageSection({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          height: Dimensions.screenHeight,
          child: Column(
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        product.imageUrl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        );
  }
}
