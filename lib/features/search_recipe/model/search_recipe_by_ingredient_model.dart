import 'dart:convert';

class SearchRecipesByIngredientModel {
  int? id;
  String? image;
  String? imageType;
  int? likes;
  int? missedIngredientCount;
  List<SedIngredient>? missedIngredients;
  String? title;
  List<SedIngredient>? unusedIngredients;
  int? usedIngredientCount;
  List<SedIngredient>? usedIngredients;

  SearchRecipesByIngredientModel({
    this.id,
    this.image,
    this.imageType,
    this.likes,
    this.missedIngredientCount,
    this.missedIngredients,
    this.title,
    this.unusedIngredients,
    this.usedIngredientCount,
    this.usedIngredients,
  });

  SearchRecipesByIngredientModel copyWith({
    int? id,
    String? image,
    String? imageType,
    int? likes,
    int? missedIngredientCount,
    List<SedIngredient>? missedIngredients,
    String? title,
    List<SedIngredient>? unusedIngredients,
    int? usedIngredientCount,
    List<SedIngredient>? usedIngredients,
  }) =>
      SearchRecipesByIngredientModel(
        id: id ?? this.id,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        likes: likes ?? this.likes,
        missedIngredientCount:
            missedIngredientCount ?? this.missedIngredientCount,
        missedIngredients: missedIngredients ?? this.missedIngredients,
        title: title ?? this.title,
        unusedIngredients: unusedIngredients ?? this.unusedIngredients,
        usedIngredientCount: usedIngredientCount ?? this.usedIngredientCount,
        usedIngredients: usedIngredients ?? this.usedIngredients,
      );

  factory SearchRecipesByIngredientModel.fromRawJson(String str) =>
      SearchRecipesByIngredientModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchRecipesByIngredientModel.fromJson(Map<String, dynamic> json) =>
      SearchRecipesByIngredientModel(
        id: json["id"],
        image: json["image"],
        imageType: json["imageType"],
        likes: json["likes"],
        missedIngredientCount: json["missedIngredientCount"],
        missedIngredients: json["missedIngredients"] == null
            ? []
            : List<SedIngredient>.from(json["missedIngredients"]!
                .map((x) => SedIngredient.fromJson(x))),
        title: json["title"],
        unusedIngredients: json["unusedIngredients"] == null
            ? []
            : List<SedIngredient>.from(json["unusedIngredients"]!
                .map((x) => SedIngredient.fromJson(x))),
        usedIngredientCount: json["usedIngredientCount"],
        usedIngredients: json["usedIngredients"] == null
            ? []
            : List<SedIngredient>.from(
                json["usedIngredients"]!.map((x) => SedIngredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "imageType": imageType,
        "likes": likes,
        "missedIngredientCount": missedIngredientCount,
        "missedIngredients": missedIngredients == null
            ? []
            : List<dynamic>.from(missedIngredients!.map((x) => x.toJson())),
        "title": title,
        "unusedIngredients": unusedIngredients == null
            ? []
            : List<dynamic>.from(unusedIngredients!.map((x) => x.toJson())),
        "usedIngredientCount": usedIngredientCount,
        "usedIngredients": usedIngredients == null
            ? []
            : List<dynamic>.from(usedIngredients!.map((x) => x.toJson())),
      };
}

class SedIngredient {
  String? aisle;
  double? amount;
  int? id;
  String? image;
  List<String>? meta;
  String? name;
  String? original;
  String? originalName;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? extendedName;

  SedIngredient({
    this.aisle,
    this.amount,
    this.id,
    this.image,
    this.meta,
    this.name,
    this.original,
    this.originalName,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.extendedName,
  });

  SedIngredient copyWith({
    String? aisle,
    double? amount,
    int? id,
    String? image,
    List<String>? meta,
    String? name,
    String? original,
    String? originalName,
    String? unit,
    String? unitLong,
    String? unitShort,
    String? extendedName,
  }) =>
      SedIngredient(
        aisle: aisle ?? this.aisle,
        amount: amount ?? this.amount,
        id: id ?? this.id,
        image: image ?? this.image,
        meta: meta ?? this.meta,
        name: name ?? this.name,
        original: original ?? this.original,
        originalName: originalName ?? this.originalName,
        unit: unit ?? this.unit,
        unitLong: unitLong ?? this.unitLong,
        unitShort: unitShort ?? this.unitShort,
        extendedName: extendedName ?? this.extendedName,
      );

  factory SedIngredient.fromRawJson(String str) =>
      SedIngredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SedIngredient.fromJson(Map<String, dynamic> json) => SedIngredient(
        aisle: json["aisle"],
        amount: json["amount"]?.toDouble(),
        id: json["id"],
        image: json["image"],
        meta: json["meta"] == null
            ? []
            : List<String>.from(json["meta"]!.map((x) => x)),
        name: json["name"],
        original: json["original"],
        originalName: json["originalName"],
        unit: json["unit"],
        unitLong: json["unitLong"],
        unitShort: json["unitShort"],
        extendedName: json["extendedName"],
      );

  Map<String, dynamic> toJson() => {
        "aisle": aisle,
        "amount": amount,
        "id": id,
        "image": image,
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "name": name,
        "original": original,
        "originalName": originalName,
        "unit": unit,
        "unitLong": unitLong,
        "unitShort": unitShort,
        "extendedName": extendedName,
      };
}
