import 'package:dash/const/const.dart';
import 'package:dash/wallets/wallethome.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: UserList(),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, String>> users = [
    {"name": "Reem belal", "email": "user1@example.com"},
    {"name": "Raneem", "email": "user2@example.com"},
    {"name": "Reem", "email": "user3@example.com"},
    {"name": " Reem", "email": "user4@example.com"},
    {"name": "Reem belal", "email": "user1@example.com"},
    {"name": "Raneem", "email": "user2@example.com"},
    {"name": "Reem", "email": "user3@example.com"},
    {"name": " Reem", "email": "user4@example.com"},
  ];

  List<Map<String, String>> filteredUsers = [];

  @override
  void initState() {
    filteredUsers = users;
    super.initState();
  }

  void filterUsers(String query) {
    setState(() {
      filteredUsers = users
          .where((user) =>
              user["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void viewUserDetails(String userName, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(userName),
          content: Text('البريد الإلكتروني: $email'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WalletHome()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              hintText: 'Find the user',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 21,
              )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredUsers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredUsers[index]["name"]!),
                subtitle: Text(filteredUsers[index]["email"]!),
                onTap: () {
                  viewUserDetails(filteredUsers[index]["name"]!,
                      filteredUsers[index]["email"]!);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
