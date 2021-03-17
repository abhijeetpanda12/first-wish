import 'package:flutter/material.dart';

const kMainTextStyle = TextStyle(
  color: Color(0xFFD32F2F),
  fontSize: 25,
  fontWeight: FontWeight.w300,
);

const kUnderInfoStyle = TextStyle(
  color: Colors.blueGrey,
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

const kHeadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.w300,
);

// const razorpayKey = "rzp_test_XJxRaPfWPpLHAt";
initConfigVars(String val, bool updateVal, String msg) {
  razorpayKey = val;
  updateRequired = updateVal;
  updateMessage = msg;
}

bool updateRequired = false;
var razorpayKey = "";
var updateMessage = "";
const razorpayAppName = "First Wish";
const razorpayAppDescription = "You are making a donation to First Wish";

const smile_forever_description = """
Set up in December of 2018, driven by the desire to put smiles on the faces of millions of not so privileged, marginalized section of the society and make a difference in their lives by "enlightened giving", the foundation "SMILE FOREVER", has primarily focused on education & healthcare and create a hunger free society and bridge the gap between have and haven'ts.
In the short span of two years since it's inception, the foundation has fed hundreds of homeless, destitutes and specially challenged fresh meals everyday; brought literacy to the doorsteps of slum kids by providing free tuition classes in slum areas, opening slum libraries to encourage the habit of reading and learning in centres which also serve as centres of adult literacy for their parents; arranging  timely blood for the thalassemic, haemophilic and sickling patients; creating a better environment through "Neat Rourkela, Clean Rourkela", pushing forward the idea of "Swachh Bharat" and conducting health awareness camps in the remotest of slums.
""";

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
