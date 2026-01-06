import 'package:coffee_shop_test/data/models/category.dart';
import 'package:coffee_shop_test/data/services/category_service.dart';

class CategoryViewModel{
  CategoryService _categoryService = CategoryService();
  Category?selectedCategory;

  Future<Map<String, dynamic>> getCategories(String token)async{
    final data =await _categoryService.getCategories(token);
    return {
      "category":data
    };
  }

 /* Future<Category?> getCategoryById(int id)async{
    try{
      selectedCategory = await _categoryService.getCategoryById(id);
      return selectedCategory;
    }catch(e){
      throw Exception(e);
    }
  }*/
}