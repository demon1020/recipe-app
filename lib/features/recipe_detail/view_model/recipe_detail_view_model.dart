import 'package:flutter/cupertino.dart';
import 'package:receipe/features/home/model/recipe_model.dart';
import 'package:receipe/features/recipe_detail/repository/recipe_detail_repository.dart';

import '../../../data/response/api_response.dart';
import '../../../data/services/app_hive.dart';
import '../../../utils/utils.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final RecipeDetailRepository _myRepo = RecipeDetailRepository();
  AppHive appHive = AppHive();

  List<Recipe> favouriteRecipeList = [];
  Map<String, String> query = {'includeNutrition': 'true'};

  ApiResponse<Recipe> recipe = ApiResponse.loading();

  setRecipesResponse(ApiResponse<Recipe> response) => recipe = response;

  init(int id) async {
    await Future.wait([
      fetchRecipes(id),
      getAllRecipes(),
    ]);
  }

  Future<void> fetchRecipes(int id) async {
    setRecipesResponse(ApiResponse.loading());
    notifyListeners();
    var response = await _myRepo.recipeDetailApi(query: query, id: id);
    response.fold((failure) {
      setRecipesResponse(ApiResponse.error(failure.message));
      Utils.flushBarErrorMessage(failure.message);
    }, (data) async {
      setRecipesResponse(ApiResponse.completed(data));
    });
    notifyListeners();
  }

  addRecipe(Recipe recipe) async {
    appHive.addRecipe(recipe);
    favouriteRecipeList.add(recipe);
    notifyListeners();
  }

  deleteRecipeById(int id) async {
    await appHive.deleteRecipeByIndex(id);
    favouriteRecipeList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  Future<void> getAllRecipes() async {
    favouriteRecipeList = await appHive.getAllRecipes();
  }
}
