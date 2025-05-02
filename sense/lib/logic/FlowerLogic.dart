import 'dart:io';

import '../UI/components/Petal.dart';
import 'package:flutter/material.dart';
import '../Data/Theme.dart';
typedef PhaseFunction = Future<void> Function(List<GlobalKey<PetalState>> petals, void Function(String) updateText,  void Function(Widget?, Widget?)callBack);



List<PhaseFunction> flowerPhases = [
   (List<GlobalKey<PetalState>> petals, void Function(String) updateText, void Function(Widget?, Widget?)callBack) async {
    updateText("Listening");
    callBack(null, Text(
                    "Searching for the sound",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: textTheme.bodyLarge,
                  ) );
    for (int i = 0; i < petals.length; i++) {
      petals[i*7%(petals.length)].currentState?.toggleActive();
      await Future.delayed(const Duration(milliseconds: 800));
    }
        callBack(null, Text(
                    "Sound detected",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: textTheme.bodyLarge,
                  ) );
    

  },
  (List<GlobalKey<PetalState>> petals, void Function(String) updateText, void Function(Widget?, Widget?)callBack) async {

    callBack(null, Text(
                    "Turn around to find the location of the sound",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: textTheme.bodyLarge,
                  ) );
    for (int i = 0; i < petals.length; i++) {
      petals[i].currentState?.toggleActive();
    }
    for (int i = 0; i < petals.length; i++) {
      petals[i].currentState?.toggleActive();
      await Future.delayed(const Duration(milliseconds: 800)); // TODO: change logic to be with phone rotation
    }

    callBack(null, Text(
      "We found a location!",
      textAlign: TextAlign.center,
      softWrap: true,
      style: textTheme.bodyLarge,
    ) );

    updateText("Complete");
  },
];

