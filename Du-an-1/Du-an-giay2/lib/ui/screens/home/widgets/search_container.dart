import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../user/widgets/add_address_container.dart';

class SearchContainer extends StatefulWidget {
  final String data_search;
  final Function(String) handler;
  const SearchContainer({
    super.key,
    required this.data_search,
    required this.handler,
  });

  @override
  State<SearchContainer> createState() => _SearchState();
}

class _SearchState extends State<SearchContainer> {
  final txtSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: "Search",
              size: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: MyText(
                title: "Cancel",
                size: 15,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              AddAddressContainer(
                width: 310,
                icon: Icon(Iconsax.search_normal, size: 30, color: Colors.grey),
                title: 'Search',
                controller: txtSearchController,
                onSubmit: (value){
                  value;
                  Navigator.pop(context, value);
                },
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Iconsax.setting,
                    size: 30,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
