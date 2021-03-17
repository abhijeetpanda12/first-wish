import 'package:first_wish/constants.dart';
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
            updateMessage,
            style:
                TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
