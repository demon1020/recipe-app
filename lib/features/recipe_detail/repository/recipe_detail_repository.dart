import '/core.dart';

class RecipeDetailRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Map<String, String> headers = {
    'x-api-Key': Constant.apiKey,
  };

  Future<dynamic> randomRecipesApi({Map<String, dynamic>? query}) async {
    return await _apiServices.callGetAPI(
        AppUrl.randomRecipes, headers, Parser.parseRandomRecipesResponse,
        query: query!);
  }

  Future<dynamic> recipeDetailApi(
      {Map<String, dynamic>? query, required int id}) async {
    return await _apiServices.callGetAPI(
        "${AppUrl.recipeDetail1}$id${AppUrl.recipeDetail2}",
        headers,
        Parser.parseRecipeInfoResponse,
        query: query!);
  }
}
