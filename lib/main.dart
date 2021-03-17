import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:first_wish/constants.dart';
import 'package:first_wish/screens/about_us_screen.dart';
import 'package:first_wish/screens/beneficiary_screen.dart';
import 'package:first_wish/screens/donation_screen.dart';
import 'package:first_wish/screens/gallery_screen.dart';
import 'package:first_wish/screens/registration_screen.dart';
import 'package:first_wish/screens/update_screen.dart';
import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  await remoteConfig.fetch(expiration: Duration(seconds: 30));
  await remoteConfig.activateFetched();

  String val = remoteConfig.getValue('razorpayKey').asString();
  String updateVal = remoteConfig.getValue('updateRequired').asString();
  initConfigVars(val, updateVal.toLowerCase() == 'true');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Color(0xFFD32F2F),
        primaryColor: Color(0xFFF44336),
        accentColor: Color(0xFF8BC34A),
      ),
      initialRoute: updateRequired
          ? UpdateScreen.id
          : (auth.currentUser != null
              ? WelcomeScreen.id
              : RegistrationScreen.id),
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        DonationScreen.id: (context) => DonationScreen(),
        BeneficiaryScreen.id: (context) => BeneficiaryScreen(),
        GalleryScreen.id: (context) => GalleryScreen(),
        AboutScreen.id: (context) => AboutScreen(),
        UpdateScreen.id: (context) => UpdateScreen()
      },
    );
  }
}
