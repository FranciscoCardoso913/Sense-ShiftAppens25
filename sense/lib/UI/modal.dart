import 'package:flutter/material.dart';
import 'package:sense/Data/Theme.dart';

class CustomModal extends StatefulWidget {
  @override
  _CustomModalState createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  int? donation;
  final ScrollController _scrollController = ScrollController();
  bool _showBottomBar = true;
  @override
  void selectAmount(int amount) {
    setState(() {
      donation = amount;
    });
  }

  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      shape: Border.all(color: Theme.of(context).colorScheme.primary),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 0.5,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Center(child: Image.asset('assets/Donations.png')),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Sense is and will always be a free app. We rely on donations to keep the project alive. Feel free to help if you can!",
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontFamily: "Poppins"),
              ),
            ),
            Wrap(
              spacing: 10,
              children:
                  [1, 5, 10, 20].map((amount) {
                    return OutlinedButton(
                      onPressed: () => selectAmount(amount),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        backgroundColor:
                            donation == amount
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).secondaryHeaderColor,
                      ),
                      child: Text('\$$amount'),
                    );
                  }).toList(),
            ),
            Align(
              alignment: Alignment.center,
              child: FilledButton(
                onPressed: () => (),
                child: Text(
                  "Donate",
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(fontFamily: "Poppins"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "And a special thanks to the organizations bellow for sponsoring this app!",
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(fontFamily: "Poppins"),
              ),
            ),
            if (_showBottomBar)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 4,
                  width: 6,
                  color:
                      Theme.of(
                        context,
                      ).secondaryHeaderColor, // Customize as needed
                ),
              ),
          ],
        ),
      ),
    );
  }
}
