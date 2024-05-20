// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      vegetarian: fields[0] as bool?,
      vegan: fields[1] as bool?,
      glutenFree: fields[2] as bool?,
      dairyFree: fields[3] as bool?,
      veryHealthy: fields[4] as bool?,
      cheap: fields[6] as bool?,
      veryPopular: fields[8] as bool?,
      sustainable: fields[9] as bool?,
      lowFodmap: fields[10] as bool?,
      weightWatcherSmartPoints: fields[12] as int?,
      gaps: fields[13] as String?,
      preparationMinutes: fields[14] as int?,
      cookingMinutes: fields[15] as int?,
      aggregateLikes: fields[16] as int?,
      healthScore: fields[17] as int?,
      creditsText: fields[18] as String?,
      license: fields[19] as String?,
      sourceName: fields[20] as String?,
      pricePerServing: fields[21] as double?,
      extendedIngredients: (fields[22] as List?)?.cast<ExtendedIngredient>(),
      id: fields[23] as int?,
      title: fields[24] as String?,
      readyInMinutes: fields[25] as int?,
      servings: fields[26] as int?,
      sourceUrl: fields[27] as String?,
      image: fields[28] as String?,
      imageType: fields[29] as String?,
      summary: fields[30] as String?,
      cuisines: (fields[31] as List?)?.cast<dynamic>(),
      dishTypes: (fields[32] as List?)?.cast<String>(),
      diets: (fields[33] as List?)?.cast<String>(),
      occasions: (fields[34] as List?)?.cast<dynamic>(),
      instructions: fields[35] as String?,
      analyzedInstructions: (fields[36] as List?)?.cast<AnalyzedInstruction>(),
      originalId: fields[37] as dynamic,
      spoonacularScore: fields[38] as double?,
      spoonacularSourceUrl: fields[39] as String?,
      isFavourite: fields[11] as bool,
      nutrition: fields[40] as Nutrition?,
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(39)
      ..writeByte(0)
      ..write(obj.vegetarian)
      ..writeByte(1)
      ..write(obj.vegan)
      ..writeByte(2)
      ..write(obj.glutenFree)
      ..writeByte(3)
      ..write(obj.dairyFree)
      ..writeByte(4)
      ..write(obj.veryHealthy)
      ..writeByte(6)
      ..write(obj.cheap)
      ..writeByte(8)
      ..write(obj.veryPopular)
      ..writeByte(9)
      ..write(obj.sustainable)
      ..writeByte(10)
      ..write(obj.lowFodmap)
      ..writeByte(11)
      ..write(obj.isFavourite)
      ..writeByte(12)
      ..write(obj.weightWatcherSmartPoints)
      ..writeByte(13)
      ..write(obj.gaps)
      ..writeByte(14)
      ..write(obj.preparationMinutes)
      ..writeByte(15)
      ..write(obj.cookingMinutes)
      ..writeByte(16)
      ..write(obj.aggregateLikes)
      ..writeByte(17)
      ..write(obj.healthScore)
      ..writeByte(18)
      ..write(obj.creditsText)
      ..writeByte(19)
      ..write(obj.license)
      ..writeByte(20)
      ..write(obj.sourceName)
      ..writeByte(21)
      ..write(obj.pricePerServing)
      ..writeByte(22)
      ..write(obj.extendedIngredients)
      ..writeByte(23)
      ..write(obj.id)
      ..writeByte(24)
      ..write(obj.title)
      ..writeByte(25)
      ..write(obj.readyInMinutes)
      ..writeByte(26)
      ..write(obj.servings)
      ..writeByte(27)
      ..write(obj.sourceUrl)
      ..writeByte(28)
      ..write(obj.image)
      ..writeByte(29)
      ..write(obj.imageType)
      ..writeByte(30)
      ..write(obj.summary)
      ..writeByte(31)
      ..write(obj.cuisines)
      ..writeByte(32)
      ..write(obj.dishTypes)
      ..writeByte(33)
      ..write(obj.diets)
      ..writeByte(34)
      ..write(obj.occasions)
      ..writeByte(35)
      ..write(obj.instructions)
      ..writeByte(36)
      ..write(obj.analyzedInstructions)
      ..writeByte(37)
      ..write(obj.originalId)
      ..writeByte(38)
      ..write(obj.spoonacularScore)
      ..writeByte(39)
      ..write(obj.spoonacularSourceUrl)
      ..writeByte(40)
      ..write(obj.nutrition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnalyzedInstructionAdapter extends TypeAdapter<AnalyzedInstruction> {
  @override
  final int typeId = 1;

  @override
  AnalyzedInstruction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyzedInstruction(
      name: fields[0] as String?,
      steps: (fields[1] as List?)?.cast<Step>(),
    );
  }

  @override
  void write(BinaryWriter writer, AnalyzedInstruction obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzedInstructionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StepAdapter extends TypeAdapter<Step> {
  @override
  final int typeId = 2;

  @override
  Step read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Step(
      number: fields[0] as int?,
      step: fields[1] as String?,
      ingredients: (fields[2] as List?)?.cast<Ent>(),
      equipment: (fields[3] as List?)?.cast<Ent>(),
      length: fields[4] as Length?,
    );
  }

  @override
  void write(BinaryWriter writer, Step obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.step)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.equipment)
      ..writeByte(4)
      ..write(obj.length);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EntAdapter extends TypeAdapter<Ent> {
  @override
  final int typeId = 3;

  @override
  Ent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ent(
      id: fields[0] as int?,
      name: fields[1] as String?,
      localizedName: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ent obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.localizedName)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LengthAdapter extends TypeAdapter<Length> {
  @override
  final int typeId = 4;

  @override
  Length read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Length(
      number: fields[0] as int?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Length obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LengthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtendedIngredientAdapter extends TypeAdapter<ExtendedIngredient> {
  @override
  final int typeId = 5;

  @override
  ExtendedIngredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtendedIngredient(
      id: fields[0] as int?,
      aisle: fields[1] as String?,
      image: fields[2] as String?,
      consistency: fields[3] as String?,
      name: fields[4] as String?,
      nameClean: fields[5] as String?,
      original: fields[6] as String?,
      originalName: fields[7] as String?,
      amount: fields[8] as double?,
      unit: fields[9] as String?,
      meta: (fields[10] as List?)?.cast<String>(),
      measures: fields[11] as Measures?,
    );
  }

  @override
  void write(BinaryWriter writer, ExtendedIngredient obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.aisle)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.consistency)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.nameClean)
      ..writeByte(6)
      ..write(obj.original)
      ..writeByte(7)
      ..write(obj.originalName)
      ..writeByte(8)
      ..write(obj.amount)
      ..writeByte(9)
      ..write(obj.unit)
      ..writeByte(10)
      ..write(obj.meta)
      ..writeByte(11)
      ..write(obj.measures);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtendedIngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeasuresAdapter extends TypeAdapter<Measures> {
  @override
  final int typeId = 6;

  @override
  Measures read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Measures(
      us: fields[0] as Metric?,
      metric: fields[1] as Metric?,
    );
  }

  @override
  void write(BinaryWriter writer, Measures obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.us)
      ..writeByte(1)
      ..write(obj.metric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasuresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetricAdapter extends TypeAdapter<Metric> {
  @override
  final int typeId = 7;

  @override
  Metric read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Metric(
      amount: fields[0] as double?,
      unitShort: fields[1] as String?,
      unitLong: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Metric obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.unitShort)
      ..writeByte(2)
      ..write(obj.unitLong);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetricAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final int typeId = 8;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      nutrients: (fields[0] as List?)?.cast<Flavonoid>(),
      properties: (fields[1] as List?)?.cast<Flavonoid>(),
      flavonoids: (fields[2] as List?)?.cast<Flavonoid>(),
      ingredients: (fields[3] as List?)?.cast<Ingredient>(),
      caloricBreakdown: fields[4] as CaloricBreakdown?,
      weightPerServing: fields[5] as WeightPerServing?,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nutrients)
      ..writeByte(1)
      ..write(obj.properties)
      ..writeByte(2)
      ..write(obj.flavonoids)
      ..writeByte(3)
      ..write(obj.ingredients)
      ..writeByte(4)
      ..write(obj.caloricBreakdown)
      ..writeByte(5)
      ..write(obj.weightPerServing);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CaloricBreakdownAdapter extends TypeAdapter<CaloricBreakdown> {
  @override
  final int typeId = 9;

  @override
  CaloricBreakdown read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CaloricBreakdown(
      percentProtein: fields[0] as double?,
      percentFat: fields[1] as double?,
      percentCarbs: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CaloricBreakdown obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.percentProtein)
      ..writeByte(1)
      ..write(obj.percentFat)
      ..writeByte(2)
      ..write(obj.percentCarbs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaloricBreakdownAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FlavonoidAdapter extends TypeAdapter<Flavonoid> {
  @override
  final int typeId = 10;

  @override
  Flavonoid read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Flavonoid(
      name: fields[0] as String?,
      amount: fields[1] as double?,
      unit: fields[2] as Unit?,
      percentOfDailyNeeds: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Flavonoid obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.percentOfDailyNeeds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlavonoidAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 11;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      id: fields[0] as int?,
      name: fields[1] as String?,
      amount: fields[2] as double?,
      unit: fields[3] as String?,
      nutrients: (fields[4] as List?)?.cast<Flavonoid>(),
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.unit)
      ..writeByte(4)
      ..write(obj.nutrients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeightPerServingAdapter extends TypeAdapter<WeightPerServing> {
  @override
  final int typeId = 12;

  @override
  WeightPerServing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightPerServing(
      amount: fields[0] as int?,
      unit: fields[1] as Unit?,
    );
  }

  @override
  void write(BinaryWriter writer, WeightPerServing obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightPerServingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnitAdapter extends TypeAdapter<Unit> {
  @override
  final int typeId = 13;

  @override
  Unit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Unit.EMPTY;
      case 1:
        return Unit.G;
      case 2:
        return Unit.IU;
      case 3:
        return Unit.KCAL;
      case 4:
        return Unit.MG;
      case 5:
        return Unit.UNIT;
      case 6:
        return Unit.UNIT_G;
      default:
        return Unit.EMPTY;
    }
  }

  @override
  void write(BinaryWriter writer, Unit obj) {
    switch (obj) {
      case Unit.EMPTY:
        writer.writeByte(0);
        break;
      case Unit.G:
        writer.writeByte(1);
        break;
      case Unit.IU:
        writer.writeByte(2);
        break;
      case Unit.KCAL:
        writer.writeByte(3);
        break;
      case Unit.MG:
        writer.writeByte(4);
        break;
      case Unit.UNIT:
        writer.writeByte(5);
        break;
      case Unit.UNIT_G:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
