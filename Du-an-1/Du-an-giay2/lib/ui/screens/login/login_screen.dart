import 'dart:math';

import 'package:coffee_shop_test/data/models/user.dart';
import 'package:coffee_shop_test/data/viewmodels/user_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/user/user_screen.dart';
import 'package:coffee_shop_test/ui/screens/user/widgets/add_address_container.dart';
import 'package:coffee_shop_test/ui/shared/widget/my_snackbar.dart';
import 'package:coffee_shop_test/ui/shared/widget/password_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/widget/Ttext.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_icon.dart';
import '../../shared/widget/my_text.dart';
import '../../shared/widget/my_textfield.dart';
import '../home/home_screen.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  final _txtPhoneController = TextEditingController();
  final _txtPasswordController = TextEditingController();
  late bool obscurren;
  final UserViewModel userViewModel = UserViewModel();
  MySnackbar mySnackbar = MySnackbar();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txtPhoneController.text = "0352993348";
    _txtPasswordController.text = "abc@123%^&";
    obscurren = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              width: 180,
              height: 180,
              "assets/images/t-store-splash-logo-black.png",
            ),
            MyText(
              title: TText.TitleLogin,
              size: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            MyText(
              title: TText.TitleLogin2,
              size: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            Center(
              child: Column(
                children: [
                  AddAddressContainer(
                    width: 410,
                    icon: Icon(Iconsax.direct_right),
                    title: "Phone",
                    controller: _txtPhoneController,
                  ),
                  PasswordContainer(
                    width: 410,
                    icon: Icon(Iconsax.password_check),
                    title: "Password",
                    controller: _txtPasswordController,
                    obscurren: obscurren,
                    handler: () {
                      obscurren=!obscurren;
                      setState(() {

                      });
                    },
                    iconPass: obscurren
                        ? Icon(Iconsax.eye_slash)
                        : Icon(Iconsax.eye),
                  ),
                  MyButton(
                    radius: 12,
                    width: 380,
                    height: 60,
                    colorButton: Colors.blueAccent,
                    child: MyText(
                      title: "Sign In",
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    handler: () async {
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
                        password: _txtPasswordController.text,
                        phone: _txtPhoneController.text,
                      );
                      UserViewModel userViewModel = UserViewModel();
                      final result = await userViewModel.userLogin(user);
                      final login = result["login"];
                      if (login["status"] == 200) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(token: login["token"]),
                          ),
                        );
                      } else {
                        mySnackbar.showSnackbar(context, "Login failure");
                      }
                    },
                  ),
                  MyButton(
                    radius: 12,
                    width: 380,
                    height: 60,
                    colorButton: Colors.white,
                    child: MyText(
                      title: "Create Account",
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    handler: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccount(),
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: TText.TitleSig,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIcon(
                        widthContainer: 60,
                        heightContainer: 60,
                        radius: 400,
                        child: Image.asset(
                          width: 30,
                          height: 30,
                          "assets/images/google-icon.png",
                        ),
                      ),
                      MyIcon(
                        widthContainer: 60,
                        heightContainer: 60,
                        radius: 400,
                        child: Image.asset(
                          width: 30,
                          height: 30,
                          "assets/images/facebook-icon.png",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //check box
          ],
        ),
      ),
    );
  }
}
