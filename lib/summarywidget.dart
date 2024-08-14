import 'package:dash/const/const.dart';
import 'package:dash/details.dart';
import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(
              "Your Profil",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50),
            ),
            Icon(
              Icons.person,
              size: 150,
            ),
            Text(
              'Reem Belal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 16,
            ),
            details(),
            Container(
              height: 15,
            ),
            Text("Your Number"),
            Container(
              color: cardBackgroundColor,
              height: 50,
              width: 300,
            ),
            Container(
              height: 15,
            ),
            Text("Your Email"),
            Container(
              color: cardBackgroundColor,
              height: 50,
              width: 300,
            ),
            Container(
              height: 15,
            ),
            Text("The Description"),
            Container(
              color: cardBackgroundColor,
              height: 100,
              width: 300,
            )
          ],
        ));
  }
}
