import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Align(
    alignment: Alignment.center,
    child: Image.asset('assets/logo.png')
  ),
            ),
              Expanded(
              flex: 6,
              child: const Text('You have pushed the button this many times:'),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centers the buttons
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.volunteer_activism_outlined), iconSize: 30,),
                      SizedBox(width: 30), // Adds space between the buttons
                      IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_rounded), iconSize: 30,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
