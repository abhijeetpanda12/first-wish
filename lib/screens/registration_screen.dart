import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wish/screens/welcome_screen.dart';
import 'package:first_wish/widgets/decorated_input.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneNumber;
  String otp;
  String _verificationId;
  final otpController = TextEditingController();

  void showSnackbar(String message) {
    print("========================================" + message);
  }

  void verifyNumber() async {
    print(phoneNumber);
    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      showSnackbar(
          "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showSnackbar(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    //Callback for when the code is sent
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      showSnackbar('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      showSnackbar("verification code: " + verificationId);
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackbar("Failed to Verify Phone Number: ${e}");
    }
  }

  void signin() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;

      showSnackbar("Successfully signed in UID: ${user.uid}");
      Navigator.popAndPushNamed(context, WelcomeScreen.id);
    } catch (e) {
      showSnackbar("Failed to sign in: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    // return Stack(children: [
    //   Image.asset(
    //     "images/background.jpg",
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     fit: BoxFit.fill,
    //   ),
    return Scaffold(
      // backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
      // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.45),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Theme.of(context).primaryColor,
                Colors.white,
                Colors.white,
                Colors.white,
                Theme.of(context).primaryColor
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Icon(
                  Icons.child_care,
                  size: 70,
                ),
              ),
              Text(
                'First Wish',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'by Smile Forever',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              DecoratedInput(
                textController: textController,
                nameText: "Enter Phone Number",
              ),
              FlatButton(
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  phoneNumber = '+91' + textController.text;
                  verifyNumber();
                },
                child: Text(
                  'Get OTP',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                minWidth: 130,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              DecoratedInput(
                textController: otpController,
                nameText: "Enter OTP",
              ),
              RaisedButton(
                padding: EdgeInsets.all(10),
                color: Theme.of(context).primaryColor,
                elevation: 10,
                onPressed: () async {
                  otp = otpController.text;
                  signin();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
        ),
      ),
    );
    // ]
  }
}

// DecoratedInput(
// textController: otpController,
// nameText: "Enter OTP",
// ),
// FlatButton(
// color: Theme.of(context).primaryColor,
// onPressed: () async {
// UserCredential userCredential =
//     await confirmationResult.confirm('123456');
// if (userCredential != null) {
// Navigator.pushNamed(context, WelcomeScreen.id);
// }
// },
// child: Text(
// 'Verify',
// style: TextStyle(color: Colors.white, fontSize: 18),
// ),
// minWidth: 200,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0),
// ),
// ),
