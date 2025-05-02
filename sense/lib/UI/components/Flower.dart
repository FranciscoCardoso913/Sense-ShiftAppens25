import 'package:flutter/material.dart';
import 'dart:math';

class FlowerButton extends StatelessWidget {
  const FlowerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Petals (you can adjust count/angle)
            for (int i = 0; i < 12; i++)
              Transform.rotate(
                angle: (pi / 6) * i -0.3,
                child: Transform.translate(
                  offset:  Offset(0, -15),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 40,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
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
                  ),
                ),
              ),

            // Center circular button
            ElevatedButton(
              onPressed: () {
                print('Center pressed');
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
                backgroundColor: Theme.of(context).colorScheme.surface
              ),
              child: const Icon(Icons.favorite),
            ),
          ],
        ),
      ),
    );
  }
}
