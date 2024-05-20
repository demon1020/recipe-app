import 'package:receipe/features/home/model/diet_model.dart';

import '/core.dart';
import '../../../data/services/app_hive.dart';
import '../model/random_recipe_model.dart';
import '../model/recipe_model.dart';
import '../model/search_recipes_model.dart';
import '../repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final HomeRepository _myRepo = HomeRepository();
  AppHive appHive = AppHive();
  final TextEditingController searchController = TextEditingController();

  Map<String, String> query = {
    'query': '',
    'diet': '',
    'number': '10',
    'limitLicense': 'true',
    'ignorePantry': 'false',
    'instructionsRequired': 'true',
    'fillIngredients': 'true',
    'fillIngredients': 'true',
    'addRecipeInformation': 'true',
    'addRecipeInstructions': 'true',
    'addRecipeNutrition': 'true',
    'sortDirection': 'asc',
  };

  List<DietModel> dietList = [
    DietModel(name: "Gluten Free"),
    DietModel(name: "Ketogenic"),
    DietModel(name: "Vegetarian"),
    DietModel(name: "Lacto-Vegetarian"),
    DietModel(name: "Ovo-Vegetarian"),
    DietModel(name: "Vegan"),
    DietModel(name: "Pescetarian"),
    DietModel(name: "Paleo"),
    DietModel(name: "Low FODMAP"),
    DietModel(name: "Whole30"),
  ];
  List<Recipe> favouriteRecipeList = [];
  ApiResponse<RandomRecipesModel> randomRecipe = ApiResponse.loading();

  setRandomRecipesResponse(ApiResponse<RandomRecipesModel> response) =>
      randomRecipe = response;

  ApiResponse<SearchRecipesModel> searchRecipes = ApiResponse.loading();

  setRecipesResponse(ApiResponse<SearchRecipesModel> response) =>
      searchRecipes = response;

  //optimized api call - minimum time to call all api
  //Both api call will be completed in 5 seconds only and not 5+3+2 = 10 secs.
  void init() async {
    await Future.wait([
      fetchRecipes(), //eg: 5 seconds
      fetchRandomRecipes(), //eg 3 seconds
      getAllRecipes(), //2 sec
    ]);
  }

  Future<void> fetchRecipes({String searchQuery = ""}) async {
    query["query"] = searchQuery;
    setRecipesResponse(ApiResponse.loading());
    notifyListeners();
    var response = await _myRepo.searchRecipesApi(query: query);
    response.fold((failure) {
      setRecipesResponse(ApiResponse.error(failure.message));
      Utils.flushBarErrorMessage(failure.message);
    }, (data) async {
      setRecipesResponse(ApiResponse.completed(data));
    });
    notifyListeners();
  }

  Future<void> fetchRandomRecipes() async {
    setRandomRecipesResponse(ApiResponse.loading());
    notifyListeners();
    var response = await _myRepo.randomRecipesApi(query: query);
    response.fold((failure) {
      setRandomRecipesResponse(ApiResponse.error(failure.message));
      Utils.flushBarErrorMessage(failure.message);
    }, (data) async {
      setRandomRecipesResponse(ApiResponse.completed(data));
    });
    notifyListeners();
  }

  addRecipe(Recipe recipe) async {
    await appHive.addRecipe(recipe);
    favouriteRecipeList.add(recipe);
    notifyListeners();
  }

  Future<void> getAllRecipes() async {
    favouriteRecipeList = await appHive.getAllRecipes();
  }

  deleteRecipeByIndex(int id) async {
    await appHive.deleteRecipeByIndex(id);
    favouriteRecipeList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  updateChip(int index) {
    dietList[index].isSelected = !dietList[index].isSelected;
    var temp = dietList.where((element) => element.isSelected).toList();
    print(temp);
    String dietQuery = "";
    for (var item in temp) {
      dietQuery += '${item.name!},';
      // dietQuery = item.name!;
    }
    dietQuery = dietQuery.trim();
    query["diet"] = dietQuery;
    fetchRecipes();
    notifyListeners();
  }
}
