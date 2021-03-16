import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wish/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'donation_card.dart';

class DonationCardList extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference _payments =
      FirebaseFirestore.instance.collection('payments');
  final formatter = DateFormat("dd MMM yyyy").add_jm();

  @override
  Widget build(BuildContext context) {
    // _payments = _payments.where('uid', isEqualTo: auth.currentUser.uid).get();
    return StreamBuilder<QuerySnapshot>(
        stream: _payments
            .where('uid', isEqualTo: auth.currentUser.uid)
            .orderBy('timestamp')
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final donationData = snapshot.data.docs;

          List<DonationRequestCard> donationCardList = [];
          for (var donation in donationData) {
            final dateString = donation.data()['timestamp'];
            donationCardList.add(DonationRequestCard(
              isApproved: donation.data()['success'],
              restaurantName: donation.data()['restaurantName'],
              amount: donation.data()['amount'],
              date: formatter.format(dateString.toDate()),
            ));
          }
          return donationCardList.isNotEmpty
              ? ListView(
                  scrollDirection: Axis.vertical,
                  children: List.from(donationCardList.reversed),
                )
              : Container(
                  child: Text(
                    'You have no transactions',
                    style: kMainTextStyle,
                  ),
                );
        });
  }
}
