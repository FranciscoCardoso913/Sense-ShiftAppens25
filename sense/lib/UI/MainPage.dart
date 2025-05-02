import 'package:flutter/material.dart';
import 'Components/PulsatingEffect.dart';
import 'components/FlowerSection.dart';
import 'package:sense/UI/modal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            FlowerSection(),
           
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomModal(),
                          );
                        },
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
