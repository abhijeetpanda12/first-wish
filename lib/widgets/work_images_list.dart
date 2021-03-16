import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:first_wish/widgets/work_image_card.dart';
import 'package:flutter/material.dart';

class WorkImagesList extends StatelessWidget {
  // final CollectionReference works =
  //     FirebaseFirestore.instance.collection('workDetails');
  // final formatter = DateFormat("dd-MMM-yy");
  // Future<firebase_storage.ListResult> storage =
  //     firebase_storage.FirebaseStorage.instance.ref('workImages/').listAll();

  List<String> imageLinks = <String>[];
  bool downloadFlag = true;

  Future<void> listExample() async {
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref('workImages/')
        .listAll();

    for (firebase_storage.Reference item in result.items) {
      String url = await item.getDownloadURL();
      imageLinks.add(url);
    }

    downloadFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: listExample(),
        builder: (context, AsyncSnapshot snapshot) {
          if (downloadFlag) {
            return Center(child: CircularProgressIndicator());
          }
          List<WorkCard> workCardList = [];
          for (String img in imageLinks) {
            workCardList.add(
              WorkCard(
                imagePath: img,
              ),
            );
          }
          return ListView(
            shrinkWrap: true,
            children: workCardList,
          );
        });

    // return Container(
    //   child: StreamBuilder<QuerySnapshot>(
    //       stream: works.snapshots(),
    //       builder: (context, AsyncSnapshot snapshot) {
    //         if (!snapshot.hasData) {
    //           return Center(child: CircularProgressIndicator());
    //         }
    //         final workData = snapshot.data.docs;
    //         List<WorkCard> workCardList = [];
    //         for (var work in workData) {
    //           final dateString = work.data()['date'];
    //           workCardList.add(
    //             WorkCard(
    //               // celebrationName: work.data()['name'],
    //               imagePath: work.data()['image'],
    //               // date: formatter.format(dateString.toDate()),
    //             ),
    //           );
    //         }
    //         return ListView(
    //           scrollDirection: Axis.vertical,
    //           shrinkWrap: true,
    //           children: workCardList,
    //         );
    //       }),
    // );
  }
}
