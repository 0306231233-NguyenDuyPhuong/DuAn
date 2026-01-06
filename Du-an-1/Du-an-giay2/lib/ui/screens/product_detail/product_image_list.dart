import 'package:flutter/material.dart';

import '../../shared/widget/my_image.dart';

class ProductImageList extends StatefulWidget {
  final product_image;
  final String name_image;
  final Function(String) onChanged;
  const ProductImageList({super.key, required this.product_image, required this.name_image, required this.onChanged});

  @override
  State<ProductImageList> createState() => _ListProductImagesState();
}

class _ListProductImagesState extends State<ProductImageList> {
  int? selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:widget.product_image['data'].length,
      itemBuilder: (context, index) {
        final item =widget.product_image["data"][index];
        //final isSelected = isSelectedIndex == index;
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                      color: /*isSelected
                                                  ? Colors.blue
                                                  : */Colors.white,
                      width: 2,
                    ),
                  ),
                  child: MyImage(
                    width: 50,
                    height: 50,
                    url:
                    "http://10.0.2.2:8989/api/images/${item['image_url']}",
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onChanged(item['image_url']);
                  });

                },
              ),
            ),
          ],
        );;
      },
    );
  }
}
