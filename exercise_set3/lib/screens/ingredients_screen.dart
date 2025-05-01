import 'package:flutter/material.dart';

class IngredientsScreen extends StatelessWidget {
  final String recipeName;
  final List<String> ingredients;

  const IngredientsScreen({
    super.key,
    required this.recipeName,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Ingredients for $recipeName'),
      ),
      body: ingredients.isEmpty
          ? Center(
            child: Text('No ingredients available for this recipe.'),
          )
          : ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return ListTile(
                title: Text(ingredient),
              );
            },
          ),
    );
  }
}