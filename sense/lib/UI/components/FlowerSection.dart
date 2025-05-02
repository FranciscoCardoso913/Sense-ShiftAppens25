import 'package:flutter/material.dart';
import 'Flower.dart';
import '../../Data/Theme.dart';
import '../../logic/FlowerLogic.dart';
class FlowerSection extends StatefulWidget {

  const FlowerSection({
    super.key
  });

  @override
  State<FlowerSection> createState() => FlowerSectionState();
}

class FlowerSectionState extends State<FlowerSection> {

  Text topText = Text("");
  Text bottomText = Text(
                    "Turn around to find the location of the sound",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: textTheme.bodyLarge,
                  );
 
  @override
  Widget build(BuildContext context) {
    return   Expanded(
              flex: 8,
              child: Column(
                children: [
                     Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: topText,
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: FlowerButton(key: Key('0'),phases: phases,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 275,
                  child: bottomText
                ),
              ),
            ),
                ],
              )
              );
  }
}
