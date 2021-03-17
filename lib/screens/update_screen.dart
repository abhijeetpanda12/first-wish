import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  static String id = "updateScreen";
  @override
  Widget build(BuildContext context) {
    // showAlertDialog(context, "Warning", "Please update your App");
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(40),
        child: Center(
          child: Text(
            'There are some Exciting changes coming your way!\n\nPlease Update your App to enjoy them.',
            style:
                TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
