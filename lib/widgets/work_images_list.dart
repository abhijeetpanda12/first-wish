import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_wish/widgets/work_image_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkImagesList extends StatelessWidget {
  final CollectionReference works =
      FirebaseFirestore.instance.collection('workDetails');
  final formatter = DateFormat("dd-MMM-yy");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: works.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final workData = snapshot.data.docs;
            List<WorkCard> workCardList = [];
            for (var work in workData) {
              final dateString = work.data()['date'];
              workCardList.add(
                WorkCard(
                  celebrationName: work.data()['name'],
                  imagePath: work.data()['image'],
                  date: formatter.format(dateString.toDate()),
                ),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: workCardList,
            );
          }),
    );
  }
}
