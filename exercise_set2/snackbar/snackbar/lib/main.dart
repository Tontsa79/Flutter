import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snackbar'),
        ),
        body: const Center(child: SnackBarButton(),
        ),
      ),
    );
  }
}


class SnackBarButton extends StatelessWidget {
  const SnackBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final snackbar = SnackBar(
          content: const Text('This is a snackbar to display some information'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
            },
          ),
        );
         ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
         child: const Text('Show Snackbar'),
         );
      }
  }