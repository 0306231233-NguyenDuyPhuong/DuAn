import 'package:coffee_shop_test/data/models/user_address.dart';
import 'package:coffee_shop_test/data/viewmodels/user_address_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_text.dart';
import 'widgets/add_address_container.dart';

class AddUserAddressScreen extends StatefulWidget {
  final String token;
  final int user_id;
  const AddUserAddressScreen({super.key, required this.token, required this.user_id});

  @override
  State<AddUserAddressScreen> createState() => _AddUserAddressState();
}

class _AddUserAddressState extends State<AddUserAddressScreen> {
  @override
  final txtFullNameController = TextEditingController();
  final txtPhoneController = TextEditingController();
  final txtCityController = TextEditingController();
  final txtDistrictController = TextEditingController();
  final txtAddressController = TextEditingController();
  UserAddressViewmodel userAddressViewmodel = UserAddressViewmodel();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new Address",
          style: const TextStyle(
            fontSize: 23,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          AddAddressContainer(
            width: 400,
            icon: Icon(
              Iconsax.user,
              size: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            title: 'Full name',
            controller: txtFullNameController,
          ),
          AddAddressContainer(
            width: 400,
            icon: Icon(
              Iconsax.user,
              size: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            title: 'Phone Number',
            controller: txtPhoneController,
          ),
          Row(
            children: [
              AddAddressContainer(
                width: 190,
                icon: Icon(
                  Iconsax.user,
                  size: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                title: 'City',
                controller: txtCityController,
              ),
              AddAddressContainer(
                width: 190,
                icon: Icon(
                  Iconsax.user,
                  size: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                title: 'district',
                controller: txtDistrictController,
              ),
            ],
          ),
          AddAddressContainer(
            width: 400,
            icon: Icon(
              Iconsax.user,
              size: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            title: 'Address',
            controller: txtAddressController,
          ),
          MyButton(
            radius: 12,
            width: 400,
            height: 60,
            colorButton: Colors.blueAccent,
            child: MyText(
              title: "Save",
              size: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            handler: () async{
              final usreAddress = UserAddress(
                id: 0,
                user_id: widget.user_id,
                full_name: txtFullNameController.text,
                phone: txtPhoneController.text,
                address: txtAddressController.text,
                city: txtCityController.text,
                district: txtDistrictController.text,
                ward: "",
                is_default: true,
                created_at: "",
                updated_at: "",
              );
              final result = await userAddressViewmodel.postUserAddress(widget.token,usreAddress);
              print(result);
              if(result["user_address"]["status"]==200){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Thêm thành công"))
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Thêm không thành công"))
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
