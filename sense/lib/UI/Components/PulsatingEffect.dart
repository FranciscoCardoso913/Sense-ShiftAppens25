import 'package:flutter/material.dart';
import 'package:pulsator/pulsator.dart';
import '../../Data/theme.dart';

class PulsatingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PulsatingButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  State<PulsatingButton> createState() => _PulsatingButtonState();
}

class _PulsatingButtonState extends State<PulsatingButton> {
  int _pulseKey = 0;

  void _handlePress() {
    setState(() {
      _pulseKey++;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Pulsator(
          key: ValueKey(_pulseKey),
          count: 4,
          duration: Duration(seconds: 4),
          repeat: 1,
          style: PulseStyle(
            color: fith,
            borderColor: quaternary,
            borderWidth: 4.0,
            gradientStyle: PulseGradientStyle(
              startColor: quaternary,
              start: 0.5,
              reverseColors: true,
            ),
            pulseCurve: Curves.easeOutQuint,
            opacityCurve: Curves.easeOut,
          ),
        ),
        TextButton(onPressed: _handlePress, child: Text(widget.buttonText)),
      ],
    );
  }
}
