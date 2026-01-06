import 'package:coffee_shop_test/ui/screens/cart/cart_screen.dart';
import 'package:coffee_shop_test/ui/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../from/address_screen.dart';
import 'account_container.dart';


class AccountSettingsContainer extends StatelessWidget {
  final String token;
  final int user_id;
  const AccountSettingsContainer({
    super.key, required this.token, required this.user_id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountContainer(
          icon: Icon(
            Iconsax.home_1,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'My Address',
          title2: 'Set shopping delivery address',
          handler: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddressScreen(token: token, user_id: user_id,),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        AccountContainer(
          icon: Icon(
            Iconsax.shopping_cart,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'My Cart',
          title2: 'Set shopping delivery address', handler: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(token: token, user_id: user_id,),
            ),
          );
        },
        ),
        const SizedBox(height: 10),
        AccountContainer(
          icon: Icon(
            Iconsax.bag_2,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'My Order',
          title2: 'Set shopping delivery address',
          handler: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderView(token: token, user_id:user_id,),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        AccountContainer(
          icon: Icon(
            Iconsax.bank,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'Bank Account',
          title2: 'Set shopping delivery address', handler: () {  },
        ),
        const SizedBox(height: 10),
        AccountContainer(
          icon: Icon(
            Iconsax.courthouse,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'My Coupons',
          title2: 'Set shopping delivery address', handler: () {  },
        ),
        const SizedBox(height: 10),
        AccountContainer(
          icon: Icon(
            Iconsax.notification,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'Notifications',
          title2: 'Set shopping delivery address', handler: () {  },
        ),
        const SizedBox(height: 10),
        AccountContainer(
          icon: Icon(
            Iconsax.printer,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            size: 30,
          ),
          title1: 'Account Privacy',
          title2: 'Set shopping delivery address', handler: () {  },
        ),

      ],
    );
  }
}

