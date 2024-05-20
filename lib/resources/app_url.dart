import 'package:receipe/resources/constants.dart';

class AppUrl {
  static String baseUrl = '${Constant.spoonacularHost}/recipes';
  static String randomRecipes = '$baseUrl/random';
  static String recipeDetail1 = '$baseUrl/';
  static String recipeDetail2 = '/information';
  static String searchRecipes = '$baseUrl/complexSearch';
  static String searchRecipesByIngredients = '$baseUrl/findByIngredients';
}
