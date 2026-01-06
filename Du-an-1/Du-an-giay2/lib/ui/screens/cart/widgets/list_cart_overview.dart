import 'package:flutter/material.dart';
import '../../../shared/widget/my_image.dart';
import '../../../shared/widget/my_text.dart';


class ListCartOverview extends StatefulWidget {
  final cartItems;
  final int user_id;
  final String token;
  final Function(int) onChanged;
  const ListCartOverview({super.key, required this.cartItems, required this.user_id, required this.token, required this.onChanged});

  @override
  State<ListCartOverview> createState() => _ListCartItemState();
}

class _ListCartItemState extends State<ListCartOverview> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.cartItems["data"].length,
      itemBuilder: (context, index) {
        final cart = widget.cartItems["data"][index];
        final productVariantValue = cart['product_variant_value'];
        final product = productVariantValue['product'];

        return Container(
          height: 120,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Image
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyImage(
                      width: 70,
                      height: 70,
                      url:
                      "http://10.0.2.2:8989/api/images/${product['image']}",
                    ),
                  ),
                ),
              ),
              //Titile
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          title: "Nike",
                          size: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        MyText(
                          title:
                          "${product['name']}",
                          size: 17,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                        MyText(
                          title:
                            "${productVariantValue['price']}",
                          size: 17,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                        MyText(
                          title:
                            "${cart['quantity']}",
                          size: 17,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
