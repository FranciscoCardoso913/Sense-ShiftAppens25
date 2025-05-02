import 'package:flutter/material.dart';
import 'package:sense/UI/MainPage.dart';
import 'Data/Theme.dart'; // make sure the path matches
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sense',
      theme: lightTheme,
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}
