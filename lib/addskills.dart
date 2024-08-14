import 'package:dash/const/const.dart';
import 'package:dash/dashboardwidget.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:flutter/material.dart';

class AddSkills extends StatefulWidget {
  const AddSkills({super.key});

  @override
  State<AddSkills> createState() => _AddSkillsState();
}

class _AddSkillsState extends State<AddSkills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (Text("Add Skills"))),
      body: Container(
        color: backgroundColor,
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/skills.jpg'))),
          ),
          Container(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: cardBackgroundColor,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  contentPadding: const EdgeInsets.all(20),
                  hintText: 'Add a Skills',
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 21,
                  )),
            ),
          ),
          Container(
              height: 40,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.all(8),
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()),
                                      (route) => false);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                            title: Text("Are You Sure"),
                            contentPadding: const EdgeInsets.all(20),
                            content:
                                const Text("Do you want to save this skill"),
                          ));
                },
                label: const Text(
                  "Save",
                ),
                icon: Icon(Icons.fork_right),
              )),
        ]),
      ),
    );
  }
}
