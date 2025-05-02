import 'package:flutter/material.dart';
import 'package:sense/Data/Theme.dart';

class HelpModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      elevation: 0.5,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/Help.png', height: 40),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "New to the app? Here's a step by step guide on how to use it. Easy peasy!",
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/Listen.png', height: 25),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Start by finding the sound your phone is hearing. Click the flower center",
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/Locate.png', height: 25),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Turn around until you find the direction of the sound",
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
