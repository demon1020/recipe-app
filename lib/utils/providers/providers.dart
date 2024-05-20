import 'package:receipe/features/recipe_detail/view_model/recipe_detail_view_model.dart';
import 'package:receipe/features/search_recipe/view_model/search_recipe_view_model.dart';

import '/core.dart';
import '../../features/home/view_model/home_view_model.dart';

class Providers {
  static List<SingleChildWidget> getAllProviders() {
    List<SingleChildWidget> _providers = [
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(create: (context) => RecipeDetailViewModel()),
      ChangeNotifierProvider(create: (context) => SearchRecipeViewModel()),
    ];
    return _providers;
  }
}
