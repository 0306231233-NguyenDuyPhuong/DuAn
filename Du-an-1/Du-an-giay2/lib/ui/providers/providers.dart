
import 'package:coffee_shop_test/data/viewmodels/user_viewmodels.dart';
import 'package:provider/provider.dart';

final appProviders = [
  ChangeNotifierProvider(create: (_)=>UserViewModel())
];