import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Portfolio Exam',
          style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 22, 59, 104),
        ),
        body: Column(
       //child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Spacer(),
             Card(
            color: const Color.fromARGB(255, 254, 105, 0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.black,
                width: 5,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Welcome',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                color: const Color.fromARGB(255, 50, 50, 50),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('TAMK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 80,
                height: 150,
                color: const Color.fromARGB(255, 101, 101, 101),
                child: Center(
                  child: Text('Flutter!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 80,
                height: 80,
                color: const Color.fromARGB(255, 152, 152, 152),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('THWS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]
          ),
          Spacer(),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 22, 59, 104),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Image.asset(
            'assets/images/JIT-logo1.png',
            fit: BoxFit.contain,
          ),
          ),
          Spacer(),
          ],
        //),
        ),
        bottomNavigationBar: Container(
          height: 25,
          color: Colors.black,
          child: Center(
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
