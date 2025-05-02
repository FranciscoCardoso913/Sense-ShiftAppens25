import 'package:flutter/material.dart';
import 'dart:math';
import '../../Data/Theme.dart';
import 'Petal.dart';
class FlowerButton extends StatefulWidget {
  const FlowerButton({super.key});

  @override
  _FlowerButtonState createState() =>  _FlowerButtonState();
}

class _FlowerButtonState extends State<FlowerButton> {

  final n = 12;
  List<Petal> petals= [];
  final colors = [fith, primary, ternary, secondary];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < n; i++){
      petals.add(Petal(color: colors[i ~/(colors.length-1)], deactivateColor: i%2==0? lightGray: darkGray ));
    }
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Petals (you can adjust count/angle)
            for (int i = 0; i < n; i++)
              Transform.rotate(
                angle: (pi / (n/2)) * i +0.3,
                child: Transform.translate(
                  offset:  Offset(0, -15),
                  child: petals[i]
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
