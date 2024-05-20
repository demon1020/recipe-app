import 'dart:convert';

import 'package:receipe/features/home/model/recipe_model.dart';

class RandomRecipesModel {
  List<Recipe>? recipes;

  RandomRecipesModel({
    this.recipes,
  });

  RandomRecipesModel copyWith({
    List<Recipe>? recipes,
  }) =>
      RandomRecipesModel(
        recipes: recipes ?? this.recipes,
      );

  factory RandomRecipesModel.fromRawJson(String str) =>
      RandomRecipesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RandomRecipesModel.fromJson(Map<String, dynamic> json) =>
      RandomRecipesModel(
        recipes: json["recipes"] == null
            ? []
            : List<Recipe>.from(
                json["recipes"]!.map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": recipes == null
            ? []
            : List<dynamic>.from(recipes!.map((x) => x.toJson())),
      };
}
