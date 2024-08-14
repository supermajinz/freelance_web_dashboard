import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [
    {
      'title': 'Notification 1',
      'description': 'هذا هو وصف الإشعار الأول.',
      'time': '10 minutes ago'
    },
    {
      'title': 'Notification 2',
      'description': 'هذا هو وصف الإشعار الثاني.',
      'time': '5 minutes ago'
    },
    {
      'title': 'Notification 3',
      'description': 'هذا هو وصف الإشعار الثالث.',
      'time': '20 minutes ago'
    },
    // أضف المزيد من الإشعارات حسب الحاجة
  ];

  void _removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(notifications[index]['title']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notifications[index]['description']!),
                  SizedBox(height: 5),
                  Text(
                    notifications[index]['time']!,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              leading: Icon(Icons.notifications),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _removeNotification(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
