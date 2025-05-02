import 'package:flutter/material.dart';

class Petal extends StatefulWidget {
  final Color color;
  final Color deactivateColor;

  const Petal({
    super.key,
    required this.color,
    required this.deactivateColor,
  });

  @override
  State<Petal> createState() => PetalState();
}

class PetalState extends State<Petal> {
  bool isActive = false;

  void toggleActive() {
    setState(() {
      isActive = !isActive;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 40,
                      height: 80,
                      decoration: BoxDecoration(
                        color: isActive? widget.color:widget.deactivateColor,
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(30, 60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // subtle shadow color
                            blurRadius: 10, // how soft the shadow is
                            offset: Offset(2, 2), // x, y offset
                          ),
                        ],
                      ),
                    ),
                  );
  }
}
