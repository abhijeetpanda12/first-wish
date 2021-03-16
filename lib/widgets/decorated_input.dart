import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecoratedInput extends StatelessWidget {
  final nameText;
  final TextEditingController textController;

  DecoratedInput({this.nameText, this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: textController,
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                  labelText: nameText,
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
          ),
        ],
      ),
    );
  }
}
