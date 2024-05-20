import '/core.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Map<String, String> headers = {
    'x-api-Key': Constant.apiKey,
  };

  Future<dynamic> randomRecipesApi({Map<String, dynamic>? query}) async {
    return await _apiServices.callGetAPI(
        AppUrl.randomRecipes, headers, Parser.parseRandomRecipesResponse,
        query: query!);
  }

  Future<dynamic> searchRecipesApi({Map<String, dynamic>? query}) async {
    return await _apiServices.callGetAPI(
        AppUrl.searchRecipes, headers, Parser.parseSearchRecipesModelResponse,
        query: query!);
  }

  Future<dynamic> searchRecipesByIngredientsApi(
      {Map<String, dynamic>? query}) async {
    return await _apiServices.callGetAPI(AppUrl.searchRecipesByIngredients,
        headers, Parser.parseSearchRecipesByIngredientModelResponse,
        query: query!);
  }
}
