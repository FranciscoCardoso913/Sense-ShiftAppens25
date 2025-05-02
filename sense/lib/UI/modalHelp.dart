import 'package:flutter/material.dart';

class ModalHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      shape: Border.all(color: Theme.of(context).colorScheme.primary),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Help",
                style: TextTheme.of(context).displayLarge?.copyWith(
                  fontFamily: "waveruder",
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              child: Text(
                "New to the app? Here’s a step by step guide on how to use it. Easy peasy!",
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontFamily: "Poppins"),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "1.Listen",
                style: TextTheme.of(context).displaySmall?.copyWith(
                  fontFamily: "waveruder",
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            Row(
              children:[ Text(
                "Start by finding the sound your phone is hearing. Click the flower center",
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontFamily: "Poppins"),
              ),]

            ),


             Align(
              alignment: Alignment.center,
              child: Text(
                "1.Listen",
                style: TextTheme.of(context).displaySmall?.copyWith(
                  fontFamily: "Poppins",
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
             ),
          ],
        ),
      ),
    );
  }
}
