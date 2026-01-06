import 'package:coffee_shop_test/data/models/user.dart';
import 'package:coffee_shop_test/data/viewmodels/user_viewmodels.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../shared/widget/Ttext.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_icon.dart';
import '../../shared/widget/my_text.dart';
import '../../shared/widget/password_container.dart';
import '../user/widgets/add_address_container.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _txtUserNameController = TextEditingController();
  final _txtPhoneController = TextEditingController();
  final _txtPasswordController = TextEditingController();
  late bool obscurren;
  MySnackbar mySnackbar = MySnackbar();
  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscurren = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: "Let's create your account",
          size: 25,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          AddAddressContainer(
            width: 400,
            icon: Icon(Iconsax.user),
            title: "user name",
            controller: _txtUserNameController,
          ),
          AddAddressContainer(
            width: 400,
            icon: Icon(Iconsax.call),
            title: "phone",
            controller: _txtPhoneController,
          ),
          PasswordContainer(
            width: 410,
            icon: Icon(Iconsax.password_check),
            title: "Password",
            controller: _txtPasswordController,
            obscurren: obscurren,
            handler: () {
              obscurren = !obscurren;
              setState(() {});
            },
            iconPass: obscurren ? Icon(Iconsax.eye_slash) : Icon(Iconsax.eye),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: MyButton(
              radius: 12,
              width: 400,
              height: 60,
              colorButton: Colors.blueAccent,
              child: MyText(
                title: "Create Account",
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              handler: () async {
                if (mySnackbar.checkInput(
                      _txtUserNameController,
                      context,
                      "User name",
                    ) ==
                    false)
                  return;
                if (mySnackbar.checkInput(
                      _txtPhoneController,
                      context,
                      "Phone",
                    ) ==
                    false)
                  return;
                if (mySnackbar.checkInput(
                      _txtPasswordController,
                      context,
                      "Password",
                    ) ==
                    false)
                  return;
                final user = User(
                  name: _txtUserNameController.text,
                  phone: _txtPhoneController.text,
                  password: _txtPasswordController.text,
                );
                final result = await userViewModel.userRegister(user);
                if (result["register"]["status"] == 201) {
                  mySnackbar.showSnackbar(context, "Register success");
                  Navigator.pop(context);
                } else {
                  mySnackbar.showSnackbar(context, "Register failue");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
