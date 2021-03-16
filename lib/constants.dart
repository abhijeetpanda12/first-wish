import 'package:flutter/material.dart';

const kMainTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w300,
);

const kUnderInfoStyle = TextStyle(
  color: Colors.grey,
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

const kHeadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 40,
  fontWeight: FontWeight.w300,
);

// const razorpayKey = "rzp_test_XJxRaPfWPpLHAt";
init_razor(String val) {
  razorpayKey = val;
}

var razorpayKey = "";
const razorpayAppName = "First Wish";
const razorpayAppDescription = "You are making a donation to First Wish";

const smile_forever_description = """
Set up in December of 2018, driven by the desire to put smiles on the faces of millions of not so privileged, marginalized section of the society and make a difference in their lives by "enlightened giving", the foundation "SMILE FOREVER", has primarily focused on education & healthcare and create a hunger free society and bridge the gap between have and haven'ts.
In the short span of two years since it's inception, the foundation has fed hundreds of homeless, destitutes and specially challenged fresh meals everyday; brought literacy to the doorsteps of slum kids by providing free tuition classes in slum areas, opening slum libraries to encourage the habit of reading and learning in centres which also serve as centres of adult literacy for their parents; arranging  timely blood for the thalassemic, haemophilic and sickling patients; creating a better environment through "Neat Rourkela, Clean Rourkela", pushing forward the idea of "Swachh Bharat" and conducting health awareness camps in the remotest of slums.
""";
