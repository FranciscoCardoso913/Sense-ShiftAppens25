import 'package:flutter/material.dart';
import 'package:sense/Data/Theme.dart';

class CustomModal extends StatefulWidget {
  @override
  _CustomModalState createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  int? donation;
  @override
  void selectAmount(int amount) {
    setState(() {
      donation = amount;
    });
  }

  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),

      elevation: 0.5,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
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
              Center(child: Image.asset('assets/Donations.png')),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Sense is and will always be a free app. We rely on donations to keep the project alive. Feel free to help if you can!",
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Wrap(
                spacing: 10,
                children:
                    [1, 2, 5, 10, 20, 50].map((amount) {
                      return OutlinedButton(
                        onPressed: () => selectAmount(amount),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          backgroundColor:
                              donation == amount
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).secondaryHeaderColor,
                          foregroundColor:
                              donation == amount
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).colorScheme.primary,
                        ),
                        child: Text('\$$amount'),
                      );
                    }).toList(),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Align(
                alignment: Alignment.center,
                child: FilledButton(
                  onPressed:
                      () => {
                        Navigator.pop(context),
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Your donation was submitted sucessfully",
                                style: TextTheme.of(
                                  context,
                                ).bodyLarge?.copyWith(
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            );
                          },
                        ),
                      },
                  child: Text(
                    "Donate",
                    style: TextTheme.of(
                      context,
                    ).bodySmall?.copyWith(fontFamily: "Poppins"),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "And a special thanks to the organizations bellow for sponsoring this app!",
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(fontFamily: "Poppins"),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              Center(child: Image.asset('assets/logo-niaefeup.png')),
            ],
          ),
        ),
      ),
    );
  }
}
