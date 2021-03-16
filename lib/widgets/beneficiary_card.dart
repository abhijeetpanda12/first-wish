import 'package:flutter/material.dart';

class BeneficiaryCard extends StatelessWidget {
  final String name;
  final String date;
  final String place;
  final String food;
  final String restaurant;

  BeneficiaryCard(
      {this.name, this.date, this.place, this.food, this.restaurant});

  @override
  Widget build(BuildContext context) {
    final foodString = this.food + " at " + this.restaurant;
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              radius: 30,
              child: Icon(
                Icons.account_circle_sharp,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 20),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        date,
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).accentColor),
                      ),
                    ),
                  ],
                ),
                Text(
                  place,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                Text(
                  foodString,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
