import '/core.dart';
import '../model/search_recipe_by_ingredient_model.dart';
import '../repository/search_recipe_repository.dart';

class SearchRecipeViewModel with ChangeNotifier {
  final SearchRecipeRepository _myRepo = SearchRecipeRepository();
  final TextEditingController searchController = TextEditingController();

  Map<String, String> query = {
    'ingredients': '',
    'number': '20',
    'limitLicense': 'true',
    'ignorePantry': 'false'
  };

  ApiResponse<List<SearchRecipesByIngredientModel>> searchRecipesByIngredients =
      ApiResponse.loading();

  setRecipesByIngredientsResponse(
          ApiResponse<List<SearchRecipesByIngredientModel>> response) =>
      searchRecipesByIngredients = response;

  Future<void> fetchRecipesByIngredients({String searchQuery = ""}) async {
    query["ingredients"] = searchQuery;
    setRecipesByIngredientsResponse(ApiResponse.loading());
    notifyListeners();
    var response = await _myRepo.searchRecipesByIngredientsApi(query: query);
    response.fold((failure) {
      setRecipesByIngredientsResponse(ApiResponse.error(failure.message));
      Utils.flushBarErrorMessage(failure.message);
    }, (data) async {
      setRecipesByIngredientsResponse(ApiResponse.completed(data));
    });
    notifyListeners();
  }
}
