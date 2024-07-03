import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/group.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("images/five.png"),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Mutabazi John',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(16.0),
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  NotificationItem(
                    profileImage: AssetImage('images/three.png'),
                    profileName: 'John Doe',
                    message: 'Upcoming appointment with your Mechanic',
                    isNew: true,
                    date: null, // No date for new notifications
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/two.png'),
                    profileName: 'Jane Smith',
                    message: 'Payment received for service',
                    isNew: false,
                    date: 'July 1, 2024',
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/one.png'),
                    profileName: 'Alex Johnson',
                    message: 'New message from support',
                    isNew: true,
                    date: null, // No date for new notifications
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/four.png'),
                    profileName: 'Emily Brown',
                    message: 'Reminder: Service due next week',
                    isNew: false,
                    date: 'July 5, 2024',
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/five.png'),
                    profileName: 'Michael Lee',
                    message: 'Your booking has been confirmed',
                    isNew: false,
                    date: 'July 2, 2024',
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/four.png'),
                    profileName: 'Sophia Wilson',
                    message: 'New event added to your calendar',
                    isNew: true,
                    date: null, // No date for new notifications
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/three.png'),
                    profileName: 'William Garcia',
                    message: 'Package delivered to your address',
                    isNew: false,
                    date: 'July 3, 2024',
                  ),
                  NotificationItem(
                    profileImage: AssetImage('images/one.png'),
                    profileName: 'Olivia Martinez',
                    message: 'You have a new follower',
                    isNew: true,
                    date: null, // No date for new notifications
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final ImageProvider profileImage;
  final String profileName;
  final String message;
  final bool isNew;
  final String? date;

  const NotificationItem({
    required this.profileImage,
    required this.profileName,
    required this.message,
    this.isNew = false,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: profileImage,
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(message),
              ),
              if (isNew && date != null)
                Text(
                  date!,
                  style: const TextStyle(fontSize: 12, color: Colors.green),
                ),
            ],
          ),
          subtitle: !isNew && date != null ? Text(date!) : null,
          trailing: isNew
              ? const Text('New', style: TextStyle(color: Colors.green))
              : null,
        ),
        const Divider(),
      ],
    );
  }
}
