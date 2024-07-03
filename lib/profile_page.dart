import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to white
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
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
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("images/five.png"),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mutabazi John',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Existing content ends here

                  // Centered profile information
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16), // Adding space

                          _buildProfileItemRow(Icons.account_circle,
                              'Insurance company\nUAP', ''),
                          _buildProfileItemRow(Icons.credit_card,
                              'National ID\n12000867549672343', ''),
                          _buildProfileItemRow(
                              Icons.location_on, 'Nationality\nRwanda', ''),
                          _buildProfileItemRow(
                              Icons.person, 'Gender\nFemale', ''),
                          _buildProfileItemRow(Icons.cake,
                              'Date of birth\n26, September 2000', ''),
                          _buildProfileItemRow(
                              Icons.phone,
                              'Phone number\nAdd phone number here',
                              ''), // Replace with actual phone number
                          _buildProfileItemRow(
                              Icons.location_city,
                              'District, sector, and state\nKimironko, Zindiro, Kigali, Rwanda',
                              ''),

                          SizedBox(height: 16), // Adding space

                          // Edit Button
                          Center(
                            child: Container(
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle edit button press
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF2596BE),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8), // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                                child: Text('Edit',
                                    style: TextStyle(fontSize: 14)),
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
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItemRow(IconData icon, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: 8), // Adding space
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
