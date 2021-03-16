import 'package:first_wish/constants.dart';
import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  final String celebrationName;
  final String imagePath;
  final String date;
  WorkCard({this.celebrationName, this.imagePath, this.date});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              celebrationName,
              overflow: TextOverflow.clip,
              style: kMainTextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              date,
              overflow: TextOverflow.clip,
              style: kUnderInfoStyle,
            ),
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(imagePath, fit: BoxFit.fill),
            )
          ],
        ),
      ),
    );
  }
}

// class DonateModalWidget extends StatelessWidget {
//   double amount;
//   final textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff757575),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(20),
//             topLeft: Radius.circular(20),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: Row(
//                 children: [
//                   Text(
//                     'Restaurant Selected : ',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     'Madhuban',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: Row(
//                 children: [
//                   Flexible(
//                     child: TextField(
//                       controller: textController,
//                       decoration: InputDecoration(
//                           labelText: "Enter the donation amount"),
//                       keyboardType: TextInputType.number,
//                       inputFormatters: <TextInputFormatter>[
//                         FilteringTextInputFormatter.digitsOnly
//                       ], // Only numbers can be entered
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             RaisedButton(
//               elevation: 10,
//               color: Colors.green,
//               onPressed: () {
//                 amount = double.parse(textController.text);
//                 print(amount);
//                 if (amount > 0)
//                   Navigator.popAndPushNamed(context, DonationScreen.id);
//               },
//               child: Text(
//                 'Submit Donation Request',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: new BorderRadius.circular(30.0),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
