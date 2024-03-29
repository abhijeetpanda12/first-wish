import 'package:first_wish/widgets/decorated_text_input.dart';
import 'package:flutter/material.dart';

class DonateModalWidget extends StatelessWidget {
  final double amount;
  final String selectedRestaurant;
  final Function onpress;
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  DonateModalWidget({this.amount, this.onpress, this.selectedRestaurant});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Restaurant Selected : ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    selectedRestaurant,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Donation Amount : ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    amount.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            DecoratedTextInput(
              textController: nameController,
              nameText: "Enter Your Name",
            ),
            DecoratedTextInput(
              textController: addressController,
              nameText: "Enter Your Address",
            ),
            FlatButton(
              color: Colors.green,
              onPressed: () {
                print(amount);
                if (amount > 0 &&
                    (nameController.text.isNotEmpty) &&
                    (addressController.text.isNotEmpty))
                  // Navigator.popAndPushNamed(context, DonationScreen.id);
                  onpress(nameController.text, addressController.text);
              },
              child: Text(
                'Proceed to Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
