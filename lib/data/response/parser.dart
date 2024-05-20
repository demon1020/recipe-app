import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:receipe/features/home/model/recipe_model.dart';

import '../../core.dart';
import '../../features/home/model/random_recipe_model.dart';
import '../../features/home/model/search_recipes_model.dart';
import '../../features/search_recipe/model/search_recipe_by_ingredient_model.dart';

class Parser {
  static Future<RandomRecipesModel> parseRandomRecipesResponse(
      String responseBody) async {
    return RandomRecipesModel.fromJson(json.decode(responseBody));
  }

  static Future<SearchRecipesModel> parseSearchRecipesModelResponse(
      String responseBody) async {
    return SearchRecipesModel.fromJson(json.decode(responseBody));
  }

  static Future<List<SearchRecipesByIngredientModel>>
      parseSearchRecipesByIngredientModelResponse(String responseBody) async {
    dynamic jsonDataList = jsonDecode(responseBody);

    return List<SearchRecipesByIngredientModel>.from(jsonDataList
        .map((item) => SearchRecipesByIngredientModel.fromJson(item)));
  }

  static Future<Recipe> parseRecipeInfoResponse(String responseBody) async {
    return Recipe.fromJson(json.decode(responseBody));
  }

  static Future<Either<AppException, Q>> parseResponse<Q, R>(
      http.Response response, ComputeCallback<String, R> callback) async {
    if (response == null) {
      print('response is null ');
      return Left(UnknownError());
    } else {
      // log('callback : ${callback.toString()}response.statusCode : ${response.statusCode} | response.body ${response.body}');
      try {
        switch (response.statusCode) {
          case 200:
            {
              var result = await compute(callback, response.body);
              return Right(result as Q);
            }
          // break;
          case 401:
            return Left(ForbiddenError());
            break;
          case 403:
            return Left(UnAuthorizedError());
            break;
          case 404:
            return Left(ServerError(
                statusCode: response.statusCode, message: "File not found"));
            break;
          case 500:
            return Left(ServerError(
                statusCode: response.statusCode, message: "Server Failure"));
            break;
          default:
            return Left(UnknownError(
                statusCode: response.statusCode, message: response.body));
        }
      } catch (e, s) {
        log(e.toString());
        log(s.toString());
        return Left(UnknownError());
      }
    }
  }
}
