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
      child: Container(
        height:
            MediaQuery.of(context).size.height * 0.7, // 70% of screen height
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/help_modal/1st_row.png'),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Start by finding the sound your phone is hearing. Click the flower center",
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "When the flower is all colored, the AI model finished executing! You'll see its result bellow the flower",
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                    Image.asset('assets/help_modal/2nd_row.png'),
                    SizedBox(width: 12),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/help_modal/3rd_row.png'),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Then you can select if you want to locate the source of the sound or detect another one",
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/Locate.png', height: 25),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/help_modal/4th_row.png'),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "The flower is gray again. Now you need to keep the phone flat and rotate 360º",
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "As you rotate, the flower gains color again to show you your progress while rotating",
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                    Image.asset('assets/help_modal/5th_row.png'),
                    SizedBox(width: 12),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/help_modal/6th_row.png'),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "With the flower colored, dashes will appear in the direction the sound is coming from!",
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "And that's it! Then you can use the buttons bellow the flower to restart the process again",
                    style: TextTheme.of(
                      context,
                    ).bodyMedium?.copyWith(fontFamily: "Poppins"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
