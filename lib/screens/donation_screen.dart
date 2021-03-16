import 'package:first_wish/constants.dart';
import 'package:first_wish/widgets/donation_request_list.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  static String id = "donationHistory";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Your Donations',
              style: kHeadingStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: DonationCardList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
