import 'package:flutter/material.dart';

class MechanicsPage extends StatelessWidget {
  const MechanicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _buildMechanicCard(context);
          },
        ),
      ),
    );
  }

  Widget _buildMechanicCard(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            'https://via.placeholder.com/100',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Positioned(
            top: 8.0,
            left: 8.0,
            child: RotatedBox(
              quarterTurns: 3,
              child: FittedBox(
                child: SizedBox(
                  width: 100.0,
                  child: Text(
                    'Mechanic Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
      body: Container(
        color: Colors.white, // Set overall background color
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Group.png"),
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            SingleChildScrollView(
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
                  SizedBox(height: 16), // Space for the AppBar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text(
                      'Available Mechanics',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(
                          'Request A mechanic',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        child: Text(
                          'Compare Prices',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildMechanicListItem(
                    'Mukamurisa Leonsi',
                    'Cra Mechanic',
                    'images/three.png',
                  ),
                  _buildMechanicListItem(
                    'Dr. Mukamurisa Leonsi',
                    'Car Mechanic',
                    'images/two.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildMechanicCard(
    String name,
    String specialty,
    String time,
    String imagePath,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Color.fromRGBO(
              37, 150, 190, 0.2), // Stroke color with increased reduced opacity
          width: 1, // Stroke width
        ),
      ),
      elevation: 4,
      shadowColor: Color.fromRGBO(
          36, 170, 219, 0.2), // Shadow color with increased reduced opacity
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white, // White background for the card
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(height: 8),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(specialty),
              Text(time, textAlign: TextAlign.center),
              SizedBox(height: 8),
              ElevatedButton(
                child: Text('View'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMechanicListItem(
    String name,
    String specialty,
    String imagePath,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(specialty),
    );
  }
}

void main() => runApp(MaterialApp(
      home: MechanicsPage(),
    ));
