import 'package:flutter/material.dart';
import '../components/card.dart';
import 'ingredients_screen.dart';

class RecipesScreen extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> recipes;

  const RecipesScreen({
    super.key,
    required this.category,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Recipes in $category'),
      ),
      body: recipes.isEmpty
          ? Center(
            child: Text('No recipes available in this category.'),
          )
          : ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return RecipeCard(
                title: recipe['name'],
                onTap: () {
                  final ingredients = List<String>.from(recipe['ingredients']);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IngredientsScreen(
                        recipeName: recipe['name'],
                        ingredients: ingredients,
                      ),
                    ),
                  );
                },
              );
            },
          )
    );
  }
}