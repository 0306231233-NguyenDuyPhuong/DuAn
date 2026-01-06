
import 'package:coffee_shop_test/data/models/user_address.dart';
import 'package:coffee_shop_test/data/services/user_address_service.dart';

class UserAddressViewmodel{
  UserAddressService userAddressService = UserAddressService();

  Future<Map<String, dynamic>> getUserAddress(String token)async{
    final data =await userAddressService.getUserAddress(token);
    return {
      "user_address":data
    };
  }

  Future<Map<String, dynamic>> postUserAddress(String token,UserAddress userAddress)async{
    final data =await userAddressService.postUserAddress(token, userAddress);
    print(data);
    return {
      "user_address":data
    };
  }

  Future<void> saveUserAddress(String key, Map<String, dynamic> value)async{
    return await userAddressService.saveUserAddress(key, value);
  }

  Future<Map<String, dynamic>?> getAddress(String key)async{
    return await userAddressService.getAddress(key);
  }
}

/**/