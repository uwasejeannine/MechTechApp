import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mechanic_detail_page.dart'; // Import your MechanicDetailPage file

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MechTech Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MechanicsPage(),
    );
  }
}

class MechanicsPage extends StatelessWidget {
  const MechanicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "../images/Ellipse 9.png"), // Replace with your image URL
          ),
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
            const Text(
              'Available Mechanics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(
                  child: MechanicCard(
                    name: 'Kate Marian',
                    time: '10 AM',
                    date: 'Dec 23',
                    type: 'Car Mechanics',
                    imageUrl:
                        '../images/Ellipse 9 (1).png', // Replace with your image URL
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MechanicCard(
                    name: 'Paul Mitchell',
                    time: '1:30 AM',
                    date: 'Dec 23',
                    type: 'Car Mechanics',
                    imageUrl:
                        '../images/Ellipse 7.png', // Replace with your image URL
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionChip(
                  label: const Text('Request Mechanic'),
                  onPressed: () {},
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                ),
                ActionChip(
                  label: const Text('Compare Prices'),
                  onPressed: () {},
                  backgroundColor: Colors.grey.withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const MechanicListTile(
              name: 'Mukamurisa Leonsi',
              type: 'Cra Mechanic',
              imageUrl:
                  '../images/Ellipse 8.png', // Replace with your image URL
            ),
            const MechanicListTile(
              name: 'Dr. Mukamurisa Leonsi',
              type: 'Car Mechanic',
              imageUrl:
                  '../images/Ellipse 8 (1).png', // Replace with your image URL
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 40,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              FontAwesomeIcons.home,
              color: Colors.white,
              size: 22.5,
            ),
            Icon(
              FontAwesomeIcons.solidEnvelope,
              color: Colors.white,
              size: 22.5,
            ),
            Icon(
              FontAwesomeIcons.user,
              color: Colors.white,
              size: 22.5,
            ),
          ],
        ),
      ),
    );
  }
}

class MechanicCard extends StatelessWidget {
  final String name;
  final String time;
  final String date;
  final String type;
  final String imageUrl;

  const MechanicCard({super.key, 
    required this.name,
    required this.time,
    required this.date,
    required this.type,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 129, 166, 253),
          width: 2,
        ),
      ),
      child: SizedBox(
        height: 158,
        width: 134,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      type,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MechanicDetailPage(
                              name: name,
                              type: type,
                              timeAvailable: time,
                              location:
                                  'Add location here', // Replace with actual location data
                              workDescription:
                                  'What I can do: r adipiscing elit. Suspendisse suscipit dolor urnar adipiscing elit. Suspendisse suscipit dolor urna',
                              // Replace with actual description data
                              capabilities:
                                  'Add capabilities here', // Replace with actual capabilities data
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 72, 111, 196),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'View',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MechanicListTile extends StatelessWidget {
  final String name;
  final String type;
  final String imageUrl;

  const MechanicListTile({super.key, 
    required this.name,
    required this.type,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(type, style: const TextStyle(color: Colors.grey)),
    );
  }
}
