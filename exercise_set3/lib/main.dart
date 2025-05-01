import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/card.dart';
import 'dart:convert';
import '/screens/recipes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Categories List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> _data = {};
  Set<String> _categoriesList = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await loadJsonFromAssets(
      'data/mobile-apps-portfolio-03-recipes.json',
    );
    setState(() {
      _data = data;
      _categoriesList = _categories(_data);
    });
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Set<String> _categories(Map<String, dynamic> data) {
    return data['recipes']
        .map<String>((recipe) => recipe['category'] as String)
        .toSet();
  }

  Set<Map<String, dynamic>> _recipesOfCategory(
    Map<String, dynamic> data,
    String category,
  ) {
    return data['recipes']
        .where((recipe) => recipe['category'] == category)
        .map<Map<String, dynamic>>((recipe) => recipe as Map<String, dynamic>)
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _categoriesList.isEmpty
          ? Center(
            child: ElevatedButton(
              onPressed: _loadData,
              child: const Text('Load Data'),
            ),
          )
          : ListView.builder(
            itemCount: _categoriesList.length,
            itemBuilder: (context, index) {
              final category = _categoriesList.elementAt(index);
              return RecipeCard(
                title: category,
                onTap: () {
                  final recipes = _recipesOfCategory(_data, category).toList();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipesScreen(
                        category: category,
                        recipes: recipes,
                      ),
                    ),
                  );
                },
              );
            },
          ),
    );
  }
}
