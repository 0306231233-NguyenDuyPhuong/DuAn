import 'package:coffee_shop_test/data/services/user_address_service.dart';
import 'package:coffee_shop_test/data/viewmodels/user_address_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/user/add_user_address_screen.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class AddressScreen extends StatefulWidget {
  final String token;
  final int user_id;
  const AddressScreen({super.key, required this.token, required this.user_id});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  UserAddressViewmodel userAddressViewmodel = UserAddressViewmodel();
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context, true);
            }, icon: Icon(Iconsax.arrow_left)),
            Text("Addresses", style: const TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUserAddressScreen(token: widget.token, user_id: widget.user_id)));
            }, icon:Icon(Iconsax.add, size: 30, fontWeight: FontWeight.bold,))
          ],
        )
      ),
      body: FutureBuilder(
          future: userAddressViewmodel.getUserAddress(widget.token), builder: (context, snapshot){
        switch(snapshot.connectionState) {
          case ConnectionState.none:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectionState.done:
            if(snapshot.hasError){
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            final data = snapshot.data!['user_address']["data"];

            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                  final item = data[index];
                  return RadioListTile(
                      title: Container(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(title: "${item["full_name"]}", size: 20, color: Colors.black, fontWeight: FontWeight.bold, maxlines: 1,),
                                  MyText(title: "${item["phone"]}", size: 17, color: Colors.grey, maxlines: 1,fontWeight: FontWeight.bold,),
                                  MyText(title: "${item["address"]}, ${item["district"]}, ${item["city"]}, ", size: 17, color: Colors.grey, maxlines: 2,fontWeight: FontWeight.bold,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      value: item["id"],
                      groupValue: selectedId,
                      activeColor: Colors.blue,
                      onChanged: (value){
                        setState(() {
                          selectedId = value as int;
                          Map<String, dynamic> userAddress = {
                            "id": item["id"],
                            "full_name": item["full_name"],
                            "phone": item["phone"],
                            "address": "${item["address"]}, ${item["district"]}, ${item["city"]}"
                          };
                          final String key = UserAddressService.key;
                          userAddressViewmodel.saveUserAddress(key, userAddress);
                        });
                      },
                  );
            });
        }
      })
    );
  }
}
/**/