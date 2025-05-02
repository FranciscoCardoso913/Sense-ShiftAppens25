import 'package:flutter/material.dart';
import 'dart:math';
import '../../Data/Theme.dart';
import 'Petal.dart';

class FlowerButton extends StatefulWidget {
  const FlowerButton({super.key});

  @override
  _FlowerButtonState createState() => _FlowerButtonState();
}

class _FlowerButtonState extends State<FlowerButton> {
  final int petalCount = 12;
  final List<Color> colors = [fith, primary, ternary, secondary];
  late final List<GlobalKey<PetalState>> petalKeys;

  @override
  void initState() {
    super.initState();
    petalKeys = List.generate(petalCount, (_) => GlobalKey<PetalState>());
  }

  Petal buildPetal(int i) {
    return Petal(
      key: petalKeys[i],
      color: colors[i ~/(colors.length-1)],
      deactivateColor: i % 2 == 0 ? lightGray : darkGray,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Petals
            for (int i = 0; i < petalCount; i++)
              Transform.rotate(
                angle: (2 * pi / petalCount) * i + 0.3,
                child: Transform.translate(
                  offset: const Offset(0, -15),
                  child: buildPetal(i),
                ),
              ),

            // Center button
            ElevatedButton(
              onPressed: () {
                for (var key in petalKeys) {
                  key.currentState?.toggleActive();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              child: const Icon(Icons.favorite),
            ),
          ],
        ),
      ),
    );
  }
}
