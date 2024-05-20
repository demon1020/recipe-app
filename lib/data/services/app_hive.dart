import 'package:hive/hive.dart';

import '../../features/home/model/recipe_model.dart';

class AppHive {
  static const String recipeBox = 'recipe';

  addRecipe(Recipe recipe) async {
    var box = await Hive.openBox<Recipe>(recipeBox);
    List<Recipe> temp = box.values.toList();
    int index = temp.indexWhere((element) => element.id == recipe.id);
    if (index == -1) {
      box.add(recipe);
    } else {
      temp[index].isFavourite = true;
      box.putAt(index, temp[index]);
    }
  }

  getAllRecipes() async {
    var box = await Hive.openBox<Recipe>(recipeBox);
    List<Recipe> temp = box.values.toList();
    return temp;
  }

  //
  // deleteRecipe(Recipe recipe) async {
  //   var box = await Hive.openBox<Recipe>(recipeBox);
  //   List<Recipe> temp = box.values.toList();
  //   int index = temp.indexWhere((element) => element.id == recipe.id);
  //   box.deleteAt(index);
  // }

  deleteRecipeByIndex(int id) async {
    var box = await Hive.openBox<Recipe>(recipeBox);
    List<Recipe> temp = box.values.toList();
    int index = temp.indexWhere((element) => element.id == id);
    await box.deleteAt(index);
  }
}
