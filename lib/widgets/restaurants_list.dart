import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_wish/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantsList extends StatelessWidget {
  final CollectionReference restaurants =
      FirebaseFirestore.instance.collection('restaurantDetails');

  final ScrollController myScrollController;
  RestaurantsList(this.myScrollController);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: StreamBuilder<QuerySnapshot>(
          stream: restaurants.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final restaurantData = snapshot.data.docs;

            List<RestaurantCard> restaurantCardList = [];
            for (var restaurant in restaurantData) {
              restaurantCardList.add(
                RestaurantCard(
                  restaurantName: restaurant.data()['name'],
                  restaurantDonations: restaurant.data()['donationString'],
                  imagePath: restaurant.data()['imagePath'],
                  amountList: restaurant.data()['coupons'].cast<int>(),
                ),
              );
            }
            return ListView(
              controller: myScrollController,
              scrollDirection: Axis.vertical,
              children: restaurantCardList,
            );
          }),
    );
  }
}

// ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// controller: myScrollController,
// itemCount: 1,
// itemBuilder: (BuildContext context, int index) {
// restaurants.get().then((querySnapshot) {
// querySnapshot.docs.forEach((result) {
// // print(result.data()['name']);
// print(result.get('name'));
// });
// });
// return RestaurantCard(
// restaurantName: 'Madhuban',
// restaurantDonations: '10K+ donations received',
// imagePath: 'images/madhuban.jpeg',
// amountList: [10, 20, 300],
// );
// },
// ),
