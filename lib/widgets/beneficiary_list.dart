import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_wish/widgets/beneficiary_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BeneficiaryList extends StatelessWidget {
  final CollectionReference beneficiaries =
      FirebaseFirestore.instance.collection('beneficiary');
  final formatter = DateFormat("dd-MMM-yy");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: beneficiaries.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final beneficiaryData = snapshot.data.docs;

            List<BeneficiaryCard> beneficiaryCardList = [];
            for (var beneficiary in beneficiaryData) {
              final dateString = beneficiary.data()['date'];

              beneficiaryCardList.add(
                BeneficiaryCard(
                  name: beneficiary.data()['name'],
                  place: beneficiary.data()['place'],
                  date: formatter.format(dateString.toDate()),
                  food: beneficiary.data()['food'],
                  restaurant: beneficiary.data()['restaurant'],
                ),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: beneficiaryCardList,
            );
          }),
    );
  }
}

// return ListView.builder(
// itemCount: 10,
// itemBuilder: (BuildContext context, int index) {
// return BeneficiaryCard(
// name: "johnny",
// place: "rkl",
// date: "1/2/3",
// food: "abc",
// restaurant: "xyz",
// );
// },
// );
