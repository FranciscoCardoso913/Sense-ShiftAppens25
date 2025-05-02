import 'package:flutter/material.dart';
import 'package:pulsator/pulsator.dart';
import 'package:sense/UI/components/Indicators.dart';
import 'dart:math';
import '../../Data/Theme.dart';
import 'Petal.dart';
import '../../logic/FlowerLogic.dart';

class FlowerButton extends StatefulWidget {
  final List<PhaseFunction> phases;
  final Future<String> Function() onGetResult;
  final void Function(Widget? top, Widget? bottom) callBack;

  const FlowerButton({
    super.key,
    required this.phases,
    required this.callBack,
    required this.onGetResult,
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
  bool _indicators = false;
  final GlobalKey<IndicatorsState> indicator = GlobalKey<IndicatorsState>();
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

  void updateInterval(int start, int end) {
    indicator.currentState?.updateInterval(start, end);
  }

  Future<void> _handlePress() async {
    setState(() {
      if (phase == 1) _indicators = true;
      if(phase == 0){
        _shouldPulsate = true;
      _pulsatorKey++;
      }
    });

    // Start the sound detection and animation in parallel
    if (phase == 0) {
      final soundDetectionFuture = widget.onGetResult();
      final animationFuture = widget.phases[phase % widget.phases.length](
        petalKeys,
        (text) {
          setState(() {
            buttonText = text;
          });
        },
        updateInterval,
        widget.callBack,
      );

      // Wait for sound detection to complete while animation runs
      final result = await soundDetectionFuture;

      // Update the top widget with the detected class
      widget.callBack(
        Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(35),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              result,
              textAlign: TextAlign.center,
              softWrap: true,
              style: textTheme.bodyLarge,
            ),
          ),
        ),
        Column(
          children: [
            Image.asset('assets/match.png'),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  phase = 0;
                });
                _handlePress();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(ternary),
                elevation: WidgetStateProperty.all(
                  4,
                ), // Optional: Customize shadow depth
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Optional: Rounded corners
                  ),
                ),
              ),
              child: Text(
                "Listen Again",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ), // Leave bottom unchanged
      );

      Future.delayed(const Duration(seconds: 1), () {
        if (_shouldPulsate) {
          setState(() {
            _shouldPulsate = false;
            _pulsatorKey = 0;
          });
        }
      });

      // Wait for the animation to complete (if needed)
      await animationFuture;
    }

    if (phase == 1) {
      updateInterval(0, 40);
      widget.callBack(
        null,
        Text(
          "Turn around to find the location of the sound",
          textAlign: TextAlign.center,
          softWrap: true,
          style: textTheme.bodyLarge,
        ),
      );

      widget.callBack(
        null,
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  phase = 0;
                });
                _handlePress();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(ternary),
                elevation: WidgetStateProperty.all(
                  4,
                ), // Optional: Customize shadow depth
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Optional: Rounded corners
                  ),
                ),
              ),
              child: Text(
                "Listen Again",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  phase = 1;
                });
                _handlePress();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(primary),

                elevation: WidgetStateProperty.all(
                  4,
                ), // Optional: Customize shadow depth
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Optional: Rounded corners
                  ),
                ),
              ),
              child: Text(
                "Scan Again",

                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ternary, // Change to your desired text color
                ),
              ),
            ),
          ],
        ),
      );

      setState(() {
        buttonText = "Complete";
      });
      updateInterval(10, 15); // TODO: change to actual function
    }

    setState(() {
      phase++;
      if (phase >= widget.phases.length) phase = 0;
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
            Indicators(key: indicator),
            // Petals
            for (int i = 0; i < petalCount; i++)
              Transform.rotate(
                angle: (2 * pi / petalCount) * i + 0.3,
                child: Transform.translate(
                  offset: const Offset(0, -15),
                  child: buildPetal(i),
                ),
              ),

            // Pulsating effect, make sure it only shows for the first phase or any condition you want
            if (_shouldPulsate && phase == 0)
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
