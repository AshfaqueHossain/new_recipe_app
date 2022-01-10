import 'package:flutter/material.dart';
import 'package:new_recipe_app/api/mock_shayanrecipe_service.dart';

import '../components/components.dart';
import '../models/models.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockShayanrecipeService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}