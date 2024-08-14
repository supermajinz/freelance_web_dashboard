import 'package:flutter/material.dart';

class report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AdminComplaintsScreen(),
    );
  }
}

class AdminComplaint {
  String name;
  String complaint;

  AdminComplaint({required this.name, required this.complaint});
}

class AdminComplaintsScreen extends StatefulWidget {
  @override
  _AdminComplaintsScreenState createState() => _AdminComplaintsScreenState();
}

class _AdminComplaintsScreenState extends State<AdminComplaintsScreen> {
  List<AdminComplaint> complaints = [
    AdminComplaint(name: 'John Doe', complaint: 'Complaint 1'),
    AdminComplaint(name: 'Jane Smith', complaint: 'Complaint 2'),
    AdminComplaint(name: 'Alice Johnson', complaint: 'Complaint 3'),
    AdminComplaint(name: 'John Doe', complaint: 'Complaint 1'),
    AdminComplaint(name: 'Jane Smith', complaint: 'Complaint 2'),
    AdminComplaint(name: 'Alice Johnson', complaint: 'Complaint 3'),
    AdminComplaint(name: 'John Doe', complaint: 'Complaint 1'),
    AdminComplaint(name: 'Jane Smith', complaint: 'Complaint 2'),
    AdminComplaint(name: 'Alice Johnson', complaint: 'Complaint 3'),
    AdminComplaint(name: 'John Doe', complaint: 'Complaint 1'),
    AdminComplaint(name: 'Jane Smith', complaint: 'Complaint 2'),
    AdminComplaint(name: 'Alice Johnson', complaint: 'Complaint 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Complaints'),
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(complaints[index].name),
              subtitle: Text(complaints[index].complaint),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  setState(() {
                    complaints.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
