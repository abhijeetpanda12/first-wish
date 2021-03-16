import 'package:flutter/material.dart';

class DecoratedTextInput extends StatelessWidget {
  final nameText;
  final TextEditingController textController;

  DecoratedTextInput({this.nameText, this.textController});

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
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                  labelText: nameText,
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: const OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
