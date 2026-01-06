import 'package:coffee_shop_test/ui/screens/user/user_screen.dart';
import 'package:coffee_shop_test/ui/screens/wishlist/wish_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../screens/home/widgets/bottom_navigation_container.dart';
import '../../screens/home/home_screen.dart';
class ContainerBottom extends StatefulWidget {
  final String token;
  final userData;
  const ContainerBottom({super.key, required this.token, this.userData});

  @override
  State<ContainerBottom> createState() => _ContainerBottomState();
}

class _ContainerBottomState extends State<ContainerBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavigationContainer(
            height: 80,
            width: 80,
            color: Colors.white,
            icon: Icon(Iconsax.home, size: 30,fontWeight: FontWeight.bold, color: Colors.black87),
            title: "Home",
            handler: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(token:widget.token,)),
              );
            },
          ),
          BottomNavigationContainer(
            height: 80,
            width: 80,
            color: Colors.white,
            icon: Icon(Iconsax.shop, size: 35, color: Colors.black),
            title: "Store",
          ),
          BottomNavigationContainer(
            height: 80,
            width: 80,
            color: Colors.white,
            icon: Icon(Iconsax.heart, size: 35, color: Colors.black),
            title: "Wishlist",
            handler: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>WishScreen(token:widget.token, user_id: 0,)),
              );
            },
          ),
          BottomNavigationContainer(
            height: 80,
            width: 80,
            color: Colors.white,
            icon: Icon(Iconsax.user, size: 35, color: Colors.black),
            title: "Profile",
            handler: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>UserScreen(token:widget.token, userData: null,)),
              );
            },
          ),
        ],
      ),
    );
  }
}
