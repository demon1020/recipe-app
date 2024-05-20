import 'dart:convert';

import 'recipe_model.dart';

class SearchRecipesModel {
  List<Recipe>? recipeList;
  int? offset;
  int? number;
  int? totalResults;

  SearchRecipesModel({
    this.recipeList,
    this.offset,
    this.number,
    this.totalResults,
  });

  SearchRecipesModel copyWith({
    List<Recipe>? results,
    int? offset,
    int? number,
    int? totalResults,
  }) =>
      SearchRecipesModel(
        recipeList: results ?? this.recipeList,
        offset: offset ?? this.offset,
        number: number ?? this.number,
        totalResults: totalResults ?? this.totalResults,
      );

  factory SearchRecipesModel.fromRawJson(String str) =>
      SearchRecipesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchRecipesModel.fromJson(Map<String, dynamic> json) =>
      SearchRecipesModel(
        recipeList: json["results"] == null
            ? []
            : List<Recipe>.from(
                json["results"]!.map((x) => Recipe.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": recipeList == null
            ? []
            : List<dynamic>.from(recipeList!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

// class Recipe {
//   int? id;
//   String? title;
//   String? image;
//   ImageType? imageType;
//
//   Recipe({
//     this.id,
//     this.title,
//     this.image,
//     this.imageType,
//   });
//
//   Recipe copyWith({
//     int? id,
//     String? title,
//     String? image,
//     ImageType? imageType,
//   }) =>
//       Recipe(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         image: image ?? this.image,
//         imageType: imageType ?? this.imageType,
//       );
//
//   factory Recipe.fromRawJson(String str) =>
//       Recipe.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
//         id: json["id"],
//         title: json["title"],
//         image: json["image"],
//         imageType: imageTypeValues.map[json["imageType"]]!,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image": image,
//         "imageType": imageTypeValues.reverse[imageType],
//       };
// }
//
// enum ImageType { JPG }
//
// final imageTypeValues = EnumValues({"jpg": ImageType.JPG});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
