import 'package:flutter/material.dart';
import 'dart:math';
import '../../Data/Theme.dart';
class Indicators extends StatelessWidget {
  const Indicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
    
    
        child: Stack(
          
          children: [
            // Petals (with slight offset)
            for (int i = 0; i < 40; i++)
              Transform.rotate(
                angle: (pi / 20) * i,
                child: Transform.translate(
                  offset: Offset(0, -40), // Move petals away from the center (adjust the 20 value)
                  child: Container(
                    width: 1,
                    height: 1370,
                    decoration: BoxDecoration(
                      color: fith,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
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
