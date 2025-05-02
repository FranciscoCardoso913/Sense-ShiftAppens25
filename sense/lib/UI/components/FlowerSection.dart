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


  int phase = 0;
  Widget top = Text("");
  Widget bottom = Text("");
  
  void setTop(Widget widget) {
    setState(() {
      top = widget;
    });
  }
    void setBottom(Widget widget) {
    setState(() {
      bottom = widget;
    });
    }
    void callBack(Widget? top, Widget? bottom){
        if(top!=null) setTop(top);
        if(bottom!=null) setBottom(bottom);
    }
  
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
                child: top,
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.center,
                child: FlowerButton(phases: flowerPhases, callBack: callBack),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 275,
                  child: bottom
                ),
              ),
            ),
                ],
              )
              );
  }
}
