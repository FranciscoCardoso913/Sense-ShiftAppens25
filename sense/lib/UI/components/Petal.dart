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
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: 40,
        height: 80,
        decoration: BoxDecoration(
          color: isActive ? widget.color : widget.deactivateColor,
          borderRadius: const BorderRadius.all(
            Radius.elliptical(30, 60),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }
}