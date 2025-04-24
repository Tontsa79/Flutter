import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showWidget = true;
  int parentCounter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Widget Lifecycle'),
        ),
        body: Center(
          child: showWidget
              ?  ThisStatefulWidget(
                onBack: () {
                  setState(() {
                    showWidget = false;
                    print('Back button pressed, hiding Stateful Widget');
                  });
                },
              )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Parent Counter: $parentCounter'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    parentCounter++;
                    print('Parent state updated: $parentCounter');
                  });
                },
                child: const Text('Update Parent State'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showWidget = !showWidget;
                    print('Toggle Stateful Widget');
                  });
                },
                child: const Text('Change Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThisStatefulWidget extends StatefulWidget {
  final VoidCallback onBack;
  const ThisStatefulWidget({super.key, required this.onBack});

  @override
  State<ThisStatefulWidget> createState() => _ThisStatefulWidgetState();
}

class _ThisStatefulWidgetState extends State<ThisStatefulWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('initState called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies called');
  }

  @override
  void didUpdateWidget(covariant ThisStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose called');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stateful Widget Lifecycle: $counter'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                  print('State updated: $counter');
                });
              },
              child: const Text('Push me, I dare you!'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onBack();
              },
              child: const Text('Back'),
            ),
          ],
        );
  }
}

