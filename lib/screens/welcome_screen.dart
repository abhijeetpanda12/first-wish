import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wish/screens/about_us_screen.dart';
import 'package:first_wish/screens/beneficiary_screen.dart';
import 'package:first_wish/screens/gallery_screen.dart';
import 'package:first_wish/screens/registration_screen.dart';
import 'package:first_wish/widgets/restaurants_list.dart';
import 'package:flutter/material.dart';

import 'donation_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = "welcomeScreen";
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "images/background.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).accentColor,
          label: Text(
            'first wishes',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.card_giftcard,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, BeneficiaryScreen.id);
          },
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.75),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: RaisedButton(
                    padding: EdgeInsets.all(1),
                    color: Colors.white,
                    elevation: 10,
                    onPressed: () {
                      Navigator.pushNamed(context, DonationScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Donations',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: RaisedButton(
                    padding: EdgeInsets.all(1),
                    color: Colors.white,
                    elevation: 10,
                    onPressed: () {
                      auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, RegistrationScreen.id, (r) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(Icons.child_care),
                      ),
                      Text(
                        'First Wish',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        elevation: 10,
                        onPressed: () {
                          Navigator.pushNamed(context, AboutScreen.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        elevation: 10,
                        onPressed: () {
                          Navigator.pushNamed(context, GalleryScreen.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Our Work',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: DraggableScrollableSheet(
                minChildSize: 0.4,
                initialChildSize: 0.5,
                maxChildSize: 1.0,
                builder: (BuildContext context, myScrollController) {
                  return RestaurantsList(myScrollController);
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
