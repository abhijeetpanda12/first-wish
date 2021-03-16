import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wish/constants.dart';
import 'package:first_wish/widgets/donate_amount_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'donate_modal.dart';

class RestaurantCard extends StatefulWidget {
  final String restaurantName;
  final String restaurantDonations;
  final String imagePath;
  final amountList;
  RestaurantCard(
      {this.restaurantName,
      this.restaurantDonations,
      this.imagePath,
      this.amountList});

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference _payments =
      FirebaseFirestore.instance.collection('payments');

  bool _amountSelected = false;
  int _donationAmount;
  Razorpay _razorpay;
  String _donorName;
  String _donorAddress;

  @override
  void initState() {
    super.initState();
    _razorpay = new Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerErrorFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  Future<void> _handlerPaymentSuccess(PaymentSuccessResponse response) async {
    _payments.doc(response.paymentId).set({
      "name": _donorName,
      "address": _donorAddress,
      "amount": _donationAmount,
      "restaurantName": widget.restaurantName,
      "uid": auth.currentUser.uid,
      "razorpayId": response.paymentId,
      "success": true,
      "timestamp": DateTime.now()
    });
    showAlertDialog(context, "Payment Success",
        "Your Payment for ₹" + _donationAmount.toString() + " is successful");
  }

  void _handlerErrorFailure(PaymentFailureResponse response) {
    _payments.add({
      "name": _donorName,
      "address": _donorAddress,
      "amount": _donationAmount,
      "restaurantName": widget.restaurantName,
      "uid": auth.currentUser.uid,
      "razorpayId": response.code,
      "success": false,
      "timestamp": DateTime.now()
    });
    showAlertDialog(context, "Payment Failure",
        "Your Payment for ₹" + _donationAmount.toString() + " has failed");
  }

  void _handlerExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }

  showAlertDialog(BuildContext context, String title, String message) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  selectAmountPress(int amount) {
    setState(() {
      _amountSelected = true;
      _donationAmount = amount;
    });
  }

  void openCheckout(name, address) {
    _donorName = name;
    _donorAddress = address;
    var options = {
      "key": razorpayKey,
      "amount": _donationAmount * 100,
      "name": razorpayAppName,
      "description": razorpayAppDescription,
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.restaurantName,
              overflow: TextOverflow.clip,
              style: kMainTextStyle,
            ),
            Text(
              widget.restaurantDonations,
              style: kUnderInfoStyle,
            ),
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(widget.imagePath, fit: BoxFit.fill),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Available Coupons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DonateAmountButton(
                  amount: widget.amountList[0],
                  onPress: selectAmountPress,
                  donation: _donationAmount,
                ),
                DonateAmountButton(
                  amount: widget.amountList[1],
                  onPress: selectAmountPress,
                  donation: _donationAmount,
                ),
                DonateAmountButton(
                  amount: widget.amountList[2],
                  onPress: selectAmountPress,
                  donation: _donationAmount,
                ),
              ],
            ),
            FlatButton(
              color: Colors.green,
              onPressed: !_amountSelected
                  ? null
                  : () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: DonateModalWidget(
                              selectedRestaurant: widget.restaurantName,
                              amount: _donationAmount.toDouble(),
                              onpress: openCheckout,
                            ),
                          ),
                        ),
                      );
                    },
              child: Text(
                'Donate',
                style: TextStyle(color: Colors.white),
              ),
              minWidth: 200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
