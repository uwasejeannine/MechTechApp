import 'package:flutter/material.dart';

class MechanicDetailPage extends StatelessWidget {
  final String name;
  final String type;
  final String timeAvailable;
  final String location;
  final String workDescription;
  final String capabilities;
  final String imageUrl;

  const MechanicDetailPage({
    super.key,
    required this.name,
    required this.type,
    required this.timeAvailable,
    required this.location,
    required this.workDescription,
    required this.capabilities,
    required this.imageUrl,
    required String mechanicName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Your Full Names',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                type,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Time available: $timeAvailable'),
            const SizedBox(height: 8),
            Text('Location: $location'),
            const SizedBox(height: 8),
            Text('Work: $workDescription'),
            const SizedBox(height: 8),
            Text('What I can do: $capabilities'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text('Reschedule'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 40,
        width: 320,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 22.5,
            ),
            Icon(
              Icons.message,
              color: Colors.white,
              size: 22.5,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size: 22.5,
            ),
          ],
        ),
      ),
    );
  }
}
