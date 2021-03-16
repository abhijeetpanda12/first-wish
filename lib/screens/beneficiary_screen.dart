import 'package:first_wish/constants.dart';
import 'package:first_wish/widgets/beneficiary_list.dart';
import 'package:flutter/material.dart';

class BeneficiaryScreen extends StatelessWidget {
  static String id = "beneficiaryHistory";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Recent Benificiaries',
              style: kHeadingStyle,
            ),
            SizedBox(
              height: 10,
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
                child: BeneficiaryList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
