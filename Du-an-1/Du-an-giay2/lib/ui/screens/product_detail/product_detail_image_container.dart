import 'package:coffee_shop_test/data/models/product.dart';
import 'package:flutter/material.dart';

import '../../shared/widget/my_image.dart';


class ProductDetailImageContainer extends StatelessWidget {
  const ProductDetailImageContainer( map, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Stack(
        children: [
          Center(
            child: Positioned(
              child: MyImage(
                width: 300,
                height: 300,
                url: "assets/images/shoes_3.png",
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            child: Container(
              height: 100,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: MyImage(
                            width: 50,
                            height: 50,
                            url: "assets/images/shoes_3.png",
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}