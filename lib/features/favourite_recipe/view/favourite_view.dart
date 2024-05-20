import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:receipe/data/services/app_hive.dart';
import 'package:receipe/features/home/model/recipe_model.dart';

import '../../home/view/home_view.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  final Box<Recipe> recipeBox = Hive.box<Recipe>('recipe');
  AppHive appHive = AppHive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Recipes'),
      ),
      body: ValueListenableBuilder(
        valueListenable: recipeBox.listenable(),
        builder: (context, Box<Recipe> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text('No Recipe added'),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              Recipe recipe = box.getAt(index)!;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: buildRecipeCard(context, recipe, index),
              );
            },
          );
        },
      ),
    );
  }
}
