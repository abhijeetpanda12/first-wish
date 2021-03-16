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
              decoration: InputDecoration(
                labelText: nameText,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
