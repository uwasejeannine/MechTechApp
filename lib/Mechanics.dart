import 'package:flutter/material.dart';

class MechanicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage:
                AssetImage("images/five.png"), // Replace with actual image
          ),
        ),
        title: const Text(
          'Mutabazi John',
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/group.png"),
              alignment: Alignment.topRight,
              fit: BoxFit.fitWidth, // Adjust the fit as per your requirement
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // White background for the rest of the body
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("images/two.png"), // Replace with actual image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.9),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kToolbarHeight + 16), // Space for the AppBar
                  const Text(
                    'Available Mechanics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMechanicCard(
                          'Kate Marian',
                          'Car Mechanics',
                          '10 AM\nDec 23',
                          'images/one.png', // Replace with actual image
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildMechanicCard(
                          'Paul Mitchell',
                          'Car Mechanics',
                          '1:30 AM\nDec 23',
                          'images/four.png', // Replace with actual image
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text('Request A mechanic'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          child: Text('Compare Prices'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildMechanicListItem(
                      'Mukamurisa Leonsi', 'Cra Mechanic', 'images/three.png'),
                  _buildMechanicListItem('Dr. Mukamurisa Leonsi',
                      'Car Mechanic', 'images/two.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.white), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white), label: 'Profile'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildMechanicCard(
      String name, String specialty, String time, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30, // Specify a radius for proper sizing
              backgroundImage:
                  AssetImage(imagePath), // Use the passed image path
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(specialty),
            Text(time, textAlign: TextAlign.center),
            SizedBox(height: 8), // Add some space before the button
            ElevatedButton(
              child: Text('View'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white, // Ensure text is visible
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMechanicListItem(
      String name, String specialty, String imagePath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath), // Use the passed image path
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(specialty),
    );
  }
}

void main() => runApp(MaterialApp(
      home: MechanicsPage(),
    ));
