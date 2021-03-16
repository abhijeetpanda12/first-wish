import 'package:flutter/material.dart';

class DonateAmountButton extends StatelessWidget {
  final int amount;
  final Function onPress;
  final int donation;

  DonateAmountButton({this.amount, this.onPress, this.donation});
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: donation == amount ? Theme.of(context).primaryColor : Colors.white,
      onPressed: () {
        onPress(amount);
      },
      child: Text(
        amount.toString(),
        style: TextStyle(
            color: donation == amount
                ? Colors.white
                : Theme.of(context).primaryColor,
            fontSize: 16),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
