import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          minWidth: MediaQuery.of(context).size.width * 0.3,
          maxHeight: MediaQuery.of(context).size.height * 0.3,
          minHeight: MediaQuery.of(context).size.height * 0.1,
        ),
    child: Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        ),
    ),
      ),
    );
  }
}