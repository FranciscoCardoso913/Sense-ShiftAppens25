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
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(onPressed: () {}, child: Text("Start")),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 250,
                  child: Text(
                    "Turn around to find the location of the sound",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.volunteer_activism_outlined),
                        iconSize: 30,
                      ),
                      SizedBox(width: 30), // Adds space between the buttons
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.help_outline_rounded),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
