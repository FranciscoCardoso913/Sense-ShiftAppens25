import 'package:flutter/material.dart';
import 'package:pulsator/pulsator.dart';
import 'dart:math';
import '../../Data/Theme.dart';
import 'Petal.dart';
import '../../logic/FlowerLogic.dart';

class FlowerButton extends StatefulWidget {
  final List<PhaseFunction> phases;
  final void Function(Widget? top, Widget? bottom) callBack;

  const FlowerButton({
    super.key,
    required this.phases,
    required this.callBack,
  });

  @override
  _FlowerButtonState createState() => _FlowerButtonState();
}

class _FlowerButtonState extends State<FlowerButton> {
  final int petalCount = 12;
  int phase = 0;
  String buttonText = 'Start';
  bool _shouldPulsate = false;
  int _pulsatorKey = 0;

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
      color: colors[i ~/ (colors.length - 1)],
      deactivateColor: i % 2 == 0 ? lightGray : darkGray,
    );
  }

  Future<void> _handlePress() async {
    setState(() {
      _shouldPulsate = true;
      _pulsatorKey++;
    });

    await widget.phases[phase% widget.phases.length](petalKeys, (text) {
      setState(() {
        buttonText = text;
      });
    }, widget.callBack);

    setState(() {
      phase++;
    });

    // Stop pulsating after animation duration
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _shouldPulsate = false;
      });
    });
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

            // Pulsating effect
            if (_shouldPulsate && phase==0)
              Pulsator(
              key: ValueKey<int>(_pulsatorKey),
              count: 6, // Increased count to show more pulses
              duration: const Duration(seconds: 9), // Make it last longer
              repeat: 1,
              style: PulseStyle(
                color: fith,
                borderColor: quaternary,
                borderWidth: 2.0, // Make border thicker for visibility
                gradientStyle: PulseGradientStyle(
                  startColor: quaternary,
                  start: 0.3,
                  reverseColors: true,
                ),
                pulseCurve: Curves.easeOutQuint,
                opacityCurve: Curves.easeOut,
              ),
            ),

            // Center button
            ElevatedButton(
              onPressed: _handlePress,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
