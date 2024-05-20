import 'dart:convert';

import 'package:hive/hive.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  bool? vegetarian;
  @HiveField(1)
  bool? vegan;
  @HiveField(2)
  bool? glutenFree;
  @HiveField(3)
  bool? dairyFree;
  @HiveField(4)
  bool? veryHealthy;
  @HiveField(6)
  @HiveField(7)
  bool? cheap;
  @HiveField(8)
  bool? veryPopular;
  @HiveField(9)
  bool? sustainable;
  @HiveField(10)
  bool? lowFodmap;
  @HiveField(11)
  bool isFavourite;
  @HiveField(12)
  int? weightWatcherSmartPoints;
  @HiveField(13)
  String? gaps;
  @HiveField(14)
  int? preparationMinutes;
  @HiveField(15)
  int? cookingMinutes;
  @HiveField(16)
  int? aggregateLikes;
  @HiveField(17)
  int? healthScore;
  @HiveField(18)
  String? creditsText;
  @HiveField(19)
  String? license;
  @HiveField(20)
  String? sourceName;
  @HiveField(21)
  double? pricePerServing;
  @HiveField(22)
  List<ExtendedIngredient>? extendedIngredients;
  @HiveField(23)
  int? id;
  @HiveField(24)
  String? title;
  @HiveField(25)
  int? readyInMinutes;
  @HiveField(26)
  int? servings;
  @HiveField(27)
  String? sourceUrl;
  @HiveField(28)
  String? image;
  @HiveField(29)
  String? imageType;
  @HiveField(30)
  String? summary;
  @HiveField(31)
  List<dynamic>? cuisines;
  @HiveField(32)
  List<String>? dishTypes;
  @HiveField(33)
  List<String>? diets;
  @HiveField(34)
  List<dynamic>? occasions;
  @HiveField(35)
  String? instructions;
  @HiveField(36)
  List<AnalyzedInstruction>? analyzedInstructions;
  @HiveField(37)
  dynamic originalId;
  @HiveField(38)
  double? spoonacularScore;
  @HiveField(39)
  String? spoonacularSourceUrl;
  @HiveField(40)
  Nutrition? nutrition;

  Recipe({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
    this.isFavourite = false,
    this.nutrition,
  });

  Recipe copyWith({
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    bool? dairyFree,
    bool? veryHealthy,
    bool? cheap,
    bool? veryPopular,
    bool? sustainable,
    bool? lowFodmap,
    int? weightWatcherSmartPoints,
    String? gaps,
    int? preparationMinutes,
    int? cookingMinutes,
    int? aggregateLikes,
    int? healthScore,
    String? creditsText,
    String? license,
    String? sourceName,
    double? pricePerServing,
    List<ExtendedIngredient>? extendedIngredients,
    int? id,
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
    String? image,
    String? imageType,
    String? summary,
    List<dynamic>? cuisines,
    List<String>? dishTypes,
    List<String>? diets,
    List<dynamic>? occasions,
    String? instructions,
    List<AnalyzedInstruction>? analyzedInstructions,
    dynamic originalId,
    double? spoonacularScore,
    String? spoonacularSourceUrl,
    Nutrition? nutrition,
  }) =>
      Recipe(
        vegetarian: vegetarian ?? this.vegetarian,
        vegan: vegan ?? this.vegan,
        glutenFree: glutenFree ?? this.glutenFree,
        dairyFree: dairyFree ?? this.dairyFree,
        veryHealthy: veryHealthy ?? this.veryHealthy,
        cheap: cheap ?? this.cheap,
        veryPopular: veryPopular ?? this.veryPopular,
        sustainable: sustainable ?? this.sustainable,
        lowFodmap: lowFodmap ?? this.lowFodmap,
        weightWatcherSmartPoints:
            weightWatcherSmartPoints ?? this.weightWatcherSmartPoints,
        gaps: gaps ?? this.gaps,
        preparationMinutes: preparationMinutes ?? this.preparationMinutes,
        cookingMinutes: cookingMinutes ?? this.cookingMinutes,
        aggregateLikes: aggregateLikes ?? this.aggregateLikes,
        healthScore: healthScore ?? this.healthScore,
        creditsText: creditsText ?? this.creditsText,
        license: license ?? this.license,
        sourceName: sourceName ?? this.sourceName,
        pricePerServing: pricePerServing ?? this.pricePerServing,
        extendedIngredients: extendedIngredients ?? this.extendedIngredients,
        id: id ?? this.id,
        title: title ?? this.title,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        servings: servings ?? this.servings,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        summary: summary ?? this.summary,
        cuisines: cuisines ?? this.cuisines,
        dishTypes: dishTypes ?? this.dishTypes,
        diets: diets ?? this.diets,
        occasions: occasions ?? this.occasions,
        instructions: instructions ?? this.instructions,
        analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
        originalId: originalId ?? this.originalId,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        spoonacularSourceUrl: spoonacularSourceUrl ?? this.spoonacularSourceUrl,
        nutrition: nutrition ?? this.nutrition,
      );

  factory Recipe.fromRawJson(String str) => Recipe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        lowFodmap: json["lowFodmap"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: json["gaps"],
        preparationMinutes: json["preparationMinutes"],
        cookingMinutes: json["cookingMinutes"],
        aggregateLikes: json["aggregateLikes"],
        healthScore: json["healthScore"],
        creditsText: json["creditsText"],
        license: json["license"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"]?.toDouble(),
        extendedIngredients: json["extendedIngredients"] == null
            ? []
            : List<ExtendedIngredient>.from(json["extendedIngredients"]!
                .map((x) => ExtendedIngredient.fromJson(x))),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        image: json["image"],
        imageType: json["imageType"],
        summary: json["summary"],
        cuisines: json["cuisines"] == null
            ? []
            : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
        dishTypes: json["dishTypes"] == null
            ? []
            : List<String>.from(json["dishTypes"]!.map((x) => x)),
        diets: json["diets"] == null
            ? []
            : List<String>.from(json["diets"]!.map((x) => x)),
        occasions: json["occasions"] == null
            ? []
            : List<dynamic>.from(json["occasions"]!.map((x) => x)),
        instructions: json["instructions"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? []
            : List<AnalyzedInstruction>.from(json["analyzedInstructions"]!
                .map((x) => AnalyzedInstruction.fromJson(x))),
        originalId: json["originalId"],
        spoonacularScore: json["spoonacularScore"]?.toDouble(),
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
        nutrition: json["nutrition"] == null
            ? null
            : Nutrition.fromJson(json["nutrition"]),
      );

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "lowFodmap": lowFodmap,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "license": license,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients": extendedIngredients == null
            ? []
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "summary": summary,
        "cuisines":
            cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
        "dishTypes": dishTypes == null
            ? []
            : List<dynamic>.from(dishTypes!.map((x) => x)),
        "diets": diets == null ? [] : List<dynamic>.from(diets!.map((x) => x)),
        "occasions": occasions == null
            ? []
            : List<dynamic>.from(occasions!.map((x) => x)),
        "instructions": instructions,
        "analyzedInstructions": analyzedInstructions == null
            ? []
            : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
        "originalId": originalId,
        "spoonacularScore": spoonacularScore,
        "spoonacularSourceUrl": spoonacularSourceUrl,
        "nutrition": nutrition?.toJson(),
      };
}

@HiveType(typeId: 1)
class AnalyzedInstruction {
  @HiveField(0)
  String? name;
  @HiveField(1)
  List<Step>? steps;

  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  AnalyzedInstruction copyWith({
    String? name,
    List<Step>? steps,
  }) =>
      AnalyzedInstruction(
        name: name ?? this.name,
        steps: steps ?? this.steps,
      );

  factory AnalyzedInstruction.fromRawJson(String str) =>
      AnalyzedInstruction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: json["name"],
        steps: json["steps"] == null
            ? []
            : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class Step {
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? step;
  @HiveField(2)
  List<Ent>? ingredients;
  @HiveField(3)
  List<Ent>? equipment;
  @HiveField(4)
  Length? length;

  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  Step copyWith({
    int? number,
    String? step,
    List<Ent>? ingredients,
    List<Ent>? equipment,
    Length? length,
  }) =>
      Step(
        number: number ?? this.number,
        step: step ?? this.step,
        ingredients: ingredients ?? this.ingredients,
        equipment: equipment ?? this.equipment,
        length: length ?? this.length,
      );

  factory Step.fromRawJson(String str) => Step.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
        ingredients: json["ingredients"] == null
            ? []
            : List<Ent>.from(json["ingredients"]!.map((x) => Ent.fromJson(x))),
        equipment: json["equipment"] == null
            ? []
            : List<Ent>.from(json["equipment"]!.map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "equipment": equipment == null
            ? []
            : List<dynamic>.from(equipment!.map((x) => x.toJson())),
        "length": length?.toJson(),
      };
}

@HiveType(typeId: 3)
class Ent {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? localizedName;
  @HiveField(3)
  String? image;

  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  Ent copyWith({
    int? id,
    String? name,
    String? localizedName,
    String? image,
  }) =>
      Ent(
        id: id ?? this.id,
        name: name ?? this.name,
        localizedName: localizedName ?? this.localizedName,
        image: image ?? this.image,
      );

  factory Ent.fromRawJson(String str) => Ent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
      };
}

@HiveType(typeId: 4)
class Length {
  @HiveField(0)
  int? number;
  @HiveField(2)
  String? unit;

  Length({
    this.number,
    this.unit,
  });

  Length copyWith({
    int? number,
    String? unit,
  }) =>
      Length(
        number: number ?? this.number,
        unit: unit ?? this.unit,
      );

  factory Length.fromRawJson(String str) => Length.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
      };
}

@HiveType(typeId: 5)
class ExtendedIngredient {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? aisle;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? consistency;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? nameClean;
  @HiveField(6)
  String? original;
  @HiveField(7)
  String? originalName;
  @HiveField(8)
  double? amount;
  @HiveField(9)
  String? unit;
  @HiveField(10)
  List<String>? meta;
  @HiveField(11)
  Measures? measures;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  ExtendedIngredient copyWith({
    int? id,
    String? aisle,
    String? image,
    String? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalName,
    double? amount,
    String? unit,
    List<String>? meta,
    Measures? measures,
  }) =>
      ExtendedIngredient(
        id: id ?? this.id,
        aisle: aisle ?? this.aisle,
        image: image ?? this.image,
        consistency: consistency ?? this.consistency,
        name: name ?? this.name,
        nameClean: nameClean ?? this.nameClean,
        original: original ?? this.original,
        originalName: originalName ?? this.originalName,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        meta: meta ?? this.meta,
        measures: measures ?? this.measures,
      );

  factory ExtendedIngredient.fromRawJson(String str) =>
      ExtendedIngredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: json["consistency"],
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalName: json["originalName"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        meta: json["meta"] == null
            ? []
            : List<String>.from(json["meta"]!.map((x) => x)),
        measures: json["measures"] == null
            ? null
            : Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistency,
        "name": name,
        "nameClean": nameClean,
        "original": original,
        "originalName": originalName,
        "amount": amount,
        "unit": unit,
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "measures": measures?.toJson(),
      };
}

@HiveType(typeId: 6)
class Measures {
  @HiveField(0)
  Metric? us;
  @HiveField(1)
  Metric? metric;

  Measures({
    this.us,
    this.metric,
  });

  Measures copyWith({
    Metric? us,
    Metric? metric,
  }) =>
      Measures(
        us: us ?? this.us,
        metric: metric ?? this.metric,
      );

  factory Measures.fromRawJson(String str) =>
      Measures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us?.toJson(),
        "metric": metric?.toJson(),
      };
}

@HiveType(typeId: 7)
class Metric {
  @HiveField(0)
  double? amount;
  @HiveField(1)
  String? unitShort;
  @HiveField(2)
  String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Metric copyWith({
    double? amount,
    String? unitShort,
    String? unitLong,
  }) =>
      Metric(
        amount: amount ?? this.amount,
        unitShort: unitShort ?? this.unitShort,
        unitLong: unitLong ?? this.unitLong,
      );

  factory Metric.fromRawJson(String str) => Metric.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"]?.toDouble(),
        unitShort: json["unitShort"],
        unitLong: json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitShort": unitShort,
        "unitLong": unitLong,
      };
}

@HiveType(typeId: 8)
class Nutrition {
  @HiveField(0)
  List<Flavonoid>? nutrients;
  @HiveField(1)
  List<Flavonoid>? properties;
  @HiveField(2)
  List<Flavonoid>? flavonoids;
  @HiveField(3)
  List<Ingredient>? ingredients;
  @HiveField(4)
  CaloricBreakdown? caloricBreakdown;
  @HiveField(5)
  WeightPerServing? weightPerServing;

  Nutrition({
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
  });

  Nutrition copyWith({
    List<Flavonoid>? nutrients,
    List<Flavonoid>? properties,
    List<Flavonoid>? flavonoids,
    List<Ingredient>? ingredients,
    CaloricBreakdown? caloricBreakdown,
    WeightPerServing? weightPerServing,
  }) =>
      Nutrition(
        nutrients: nutrients ?? this.nutrients,
        properties: properties ?? this.properties,
        flavonoids: flavonoids ?? this.flavonoids,
        ingredients: ingredients ?? this.ingredients,
        caloricBreakdown: caloricBreakdown ?? this.caloricBreakdown,
        weightPerServing: weightPerServing ?? this.weightPerServing,
      );

  factory Nutrition.fromRawJson(String str) =>
      Nutrition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        nutrients: json["nutrients"] == null
            ? []
            : List<Flavonoid>.from(
                json["nutrients"]!.map((x) => Flavonoid.fromJson(x))),
        properties: json["properties"] == null
            ? []
            : List<Flavonoid>.from(
                json["properties"]!.map((x) => Flavonoid.fromJson(x))),
        flavonoids: json["flavonoids"] == null
            ? []
            : List<Flavonoid>.from(
                json["flavonoids"]!.map((x) => Flavonoid.fromJson(x))),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        caloricBreakdown: json["caloricBreakdown"] == null
            ? null
            : CaloricBreakdown.fromJson(json["caloricBreakdown"]),
        weightPerServing: json["weightPerServing"] == null
            ? null
            : WeightPerServing.fromJson(json["weightPerServing"]),
      );

  Map<String, dynamic> toJson() => {
        "nutrients": nutrients == null
            ? []
            : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
        "flavonoids": flavonoids == null
            ? []
            : List<dynamic>.from(flavonoids!.map((x) => x.toJson())),
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "caloricBreakdown": caloricBreakdown?.toJson(),
        "weightPerServing": weightPerServing?.toJson(),
      };
}

@HiveType(typeId: 9)
class CaloricBreakdown {
  @HiveField(0)
  double? percentProtein;
  @HiveField(1)
  double? percentFat;
  @HiveField(2)
  double? percentCarbs;

  CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  CaloricBreakdown copyWith({
    double? percentProtein,
    double? percentFat,
    double? percentCarbs,
  }) =>
      CaloricBreakdown(
        percentProtein: percentProtein ?? this.percentProtein,
        percentFat: percentFat ?? this.percentFat,
        percentCarbs: percentCarbs ?? this.percentCarbs,
      );

  factory CaloricBreakdown.fromRawJson(String str) =>
      CaloricBreakdown.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) =>
      CaloricBreakdown(
        percentProtein: json["percentProtein"]?.toDouble(),
        percentFat: json["percentFat"]?.toDouble(),
        percentCarbs: json["percentCarbs"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentProtein": percentProtein,
        "percentFat": percentFat,
        "percentCarbs": percentCarbs,
      };
}

@HiveType(typeId: 10)
class Flavonoid {
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? amount;
  @HiveField(2)
  Unit? unit;
  @HiveField(3)
  double? percentOfDailyNeeds;

  Flavonoid({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  Flavonoid copyWith({
    String? name,
    double? amount,
    Unit? unit,
    double? percentOfDailyNeeds,
  }) =>
      Flavonoid(
        name: name ?? this.name,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        percentOfDailyNeeds: percentOfDailyNeeds ?? this.percentOfDailyNeeds,
      );

  factory Flavonoid.fromRawJson(String str) =>
      Flavonoid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Flavonoid.fromJson(Map<String, dynamic> json) => Flavonoid(
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: unitValues.map[json["unit"]] ?? Unit.EMPTY,
        percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unitValues.reverse[unit],
        "percentOfDailyNeeds": percentOfDailyNeeds,
      };
}

@HiveType(typeId: 11)
class Ingredient {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  double? amount;
  @HiveField(3)
  String? unit;
  @HiveField(4)
  List<Flavonoid>? nutrients;

  Ingredient({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  Ingredient copyWith({
    int? id,
    String? name,
    double? amount,
    String? unit,
    List<Flavonoid>? nutrients,
  }) =>
      Ingredient(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        nutrients: nutrients ?? this.nutrients,
      );

  factory Ingredient.fromRawJson(String str) =>
      Ingredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        nutrients: json["nutrients"] == null
            ? []
            : List<Flavonoid>.from(
                json["nutrients"]!.map((x) => Flavonoid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "unit": unit,
        "nutrients": nutrients == null
            ? []
            : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 12)
class WeightPerServing {
  @HiveField(0)
  int? amount;
  @HiveField(1)
  Unit? unit;

  WeightPerServing({
    this.amount,
    this.unit,
  });

  WeightPerServing copyWith({
    int? amount,
    Unit? unit,
  }) =>
      WeightPerServing(
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
      );

  factory WeightPerServing.fromRawJson(String str) =>
      WeightPerServing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeightPerServing.fromJson(Map<String, dynamic> json) =>
      WeightPerServing(
        amount: json["amount"],
        unit: unitValues.map[json["unit"]]!,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unitValues.reverse[unit],
      };
}

@HiveType(typeId: 13)
enum Unit {
  @HiveField(0)
  EMPTY,
  @HiveField(1)
  G,
  @HiveField(2)
  IU,
  @HiveField(3)
  KCAL,
  @HiveField(4)
  MG,
  @HiveField(5)
  UNIT,
  @HiveField(6)
  UNIT_G,
}

final unitValues = EnumValues({
  "": Unit.EMPTY,
  "µg": Unit.G,
  "IU": Unit.IU,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "%": Unit.UNIT,
  "g": Unit.UNIT_G
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

Map<Unit, String> unitMap = {
  Unit.EMPTY: "",
  Unit.G: "µg",
  Unit.IU: "IU",
  Unit.KCAL: "kcal",
  Unit.MG: "mg",
  Unit.UNIT: "%",
  Unit.UNIT_G: "g"
};
