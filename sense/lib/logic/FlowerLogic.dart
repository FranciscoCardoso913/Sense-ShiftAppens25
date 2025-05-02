import 'dart:io';

import '../UI/components/Petal.dart';
import 'package:flutter/material.dart';

typedef PhaseFunction = Future<void> Function(List<GlobalKey<PetalState>> petals);


List<PhaseFunction> phases = [
   (List<GlobalKey<PetalState>> petals) async {
    for (int i = 0; i < petals.length; i++) {
      petals[i*7%(petals.length)].currentState?.toggleActive();
      await Future.delayed(const Duration(milliseconds: 800));
    }
  },
  (List<GlobalKey<PetalState>> petals) async {
    for (int i = 0; i < petals.length; i++) {
      petals[i].currentState?.toggleActive();
      await Future.delayed(const Duration(milliseconds: 800)); // TODO: change logic to be with phone rotation
    }
  },
];

