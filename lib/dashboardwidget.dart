import 'package:dash/activityDetailsCard.dart';
import 'package:dash/addcalssification.dart';
import 'package:dash/addskills.dart';
import 'package:dash/apicategories.dart';
import 'package:dash/appbar.dart';

import 'package:dash/categorywidget.dart';
import 'package:dash/const/const.dart';
import 'package:dash/headerwidgwt.dart';
import 'package:dash/posts.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:dash/screen/repot.dart';
import 'package:dash/screen/users.dart';
import 'package:dash/skills.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppBarwidget(),
      TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: cardBackgroundColor,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 21,
            )),
      ),
      Row(children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Skills",
            style: TextStyle(
                color: selectionColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        Container(
          width: 550,
        ),
        Container(
            height: 40,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.all(8),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Posts()));
              },
              label: const Text(
                "Posts",
              ),
              icon: Icon(Icons.post_add),
            )),
        Container(
            height: 40,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.all(8),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => report()));
              },
              label: const Text(
                "Report",
              ),
              icon: Icon(Icons.report),
            )),
        Container(
            height: 40,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.all(8),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddSkills()));
              },
              label: const Text(
                "Add a Skills",
              ),
              icon: Icon(Icons.add),
            )),
      ]),
      CategoryWidget(),
      Padding(
        padding: EdgeInsets.only(top: 20, left: 10),
        child: Text(
          "Categoris",
          style: TextStyle(
              color: selectionColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      SkillsWidget(),
      Container(
        height: 50,
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(100)),
          padding: EdgeInsets.all(8),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddClasii()));
            },
            label: const Text(
              "Add a Classification",
            ),
            icon: Icon(Icons.add),
          )),
    ]);
  }
}
