import 'package:flutter/material.dart';
import 'dart:math';
import '../../Data/Theme.dart';

class Indicators extends StatefulWidget {
  final int start; 
  final int end;

  const Indicators({super.key, this.start = 0, this.end = 0 });

  @override
  State<Indicators> createState() => IndicatorsState();
}

class IndicatorsState extends State<Indicators> {
  late int start;
  late int end;

  @override
  void initState() {
    super.initState();
    start = widget.start;
    end = widget.end;
  }

  void updateInterval(int _start, int _end) {
    setState(() {
      start = _start;
      end = _end;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: SizedBox(
        child: Stack(
          children: [
            for (int i = start; i < end; i++)
              Transform.rotate(
                angle: (pi/20) * i,
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: Container(
                    width: 1,
                    height: 500,
                    decoration: BoxDecoration(
                      color: fith,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
