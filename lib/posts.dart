import 'package:dash/const/const.dart';
import 'package:dash/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var username = "Reem Belal";
  var email;
  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username")!;
      email = preferences.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text("The Posts"),
            ),
            body: ListView(
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          //  margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text(
                            "I want to work in architecture. I graduated about two years ago and have not gotten a job opportunity yet"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100)),
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Posts()));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Posts()));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/girl.jpg'))),
                          ),
                        ),
                        title: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(username),
                        ),
                        trailing: Icon(Icons.filter_list),
                        subtitle: Text("I want to work in flutter"),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                              (route) => false);
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                                title: Text("Are You Sure"),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: const Text(
                                                    "Are you sure you want to delete the post?"),
                                              ));
                                    },
                                    label: const Text(
                                      "Delet",
                                    ),
                                    icon: Icon(Icons.delete),
                                  ))),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                              child: Container(
                            width: 100,
                          )),
                          Expanded(
                            child: Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MainScreen()),
                                                            (route) => false);
                                                  },
                                                  child: const Text("Yes"),
                                                ),
                                              ],
                                              title: Text("Are You Sure"),
                                              contentPadding:
                                                  const EdgeInsets.all(20),
                                              content: const Text(
                                                  "Do you want to approve the publication of the post?"),
                                            ));
                                  },
                                  label: const Text(
                                    "Accept",
                                  ),
                                  icon: Icon(Icons.turn_right_outlined),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
