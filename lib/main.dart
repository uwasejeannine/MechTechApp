import 'package:flutter/material.dart';

void main() {
  runApp(MechTechApp());
}

class MechTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MechTech Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MechTechHomePage(),
    );
  }
}

class MechTechHomePage extends StatefulWidget {
  @override
  _MechTechHomePageState createState() => _MechTechHomePageState();
}

class _MechTechHomePageState extends State<MechTechHomePage> {
  final _serviceController = TextEditingController();
  final _reviewController = TextEditingController();
  bool _isServiceScheduled = false;
  bool _isLoggedIn = false;
  String _review = '';

  void _scheduleService() {
    setState(() {
      _isServiceScheduled = true;
    });
  }

  void _submitReview() {
    setState(() {
      _review = _reviewController.text;
    });
  }

  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _navigateToMechanics() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MechanicProfilesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MechTech Project'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Welcome to MechTech',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Schedule Service'),
                          content: TextField(
                            controller: _serviceController,
                            decoration: InputDecoration(
                              hintText: 'Enter service details',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _scheduleService();
                                Navigator.of(context).pop();
                              },
                              child: Text('Schedule'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Service Scheduling'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (_isLoggedIn) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Leave a Review'),
                            content: TextField(
                              controller: _reviewController,
                              decoration: InputDecoration(
                                hintText: 'Enter your review',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _submitReview();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Submit'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Login'),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your username',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _login();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Login'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Reviews'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (_isServiceScheduled)
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        'Service scheduled: ${_serviceController.text}',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 16),
              if (_review.isNotEmpty)
                Container(
                  color: Colors.blue[100],
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.comment, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Review: $_review',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 16),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Services',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('• Service Scheduling'),
                    Text('• Mechanic Profiles and Reviews'),
                    Text('• Instant Pricing Engine'),
                    Text('• Online Repair Records'),
                    Text('• Maintenance Notifications'),
                    Text('• Emergency Assistance'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue[100 * (index + 1)],
                      child: Center(child: Text('Grid Item $index')),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 100,
                  minHeight: 50,
                  maxWidth: 200,
                  maxHeight: 100,
                ),
                child: Container(
                  color: Colors.amber,
                  child: Center(child: Text('Constrained Box')),
                ),
              ),
              SizedBox(height: 16),
              FittedBox(
                child: Container(
                  color: Colors.green,
                  child: Text('FittedBox Example', style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(height: 16),
              RotatedBox(
                quarterTurns: 1,
                child: Text('Rotated Box', style: TextStyle(fontSize: 20, color: Colors.purple)),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.pink,
                  child: Center(child: Text('SizedBox')),
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.settings, size: 50, color: Colors.blue),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: _navigateToMechanics,
                child: Chip(
                  label: Text('Mechanic Available'),
                  avatar: Icon(Icons.check, color: Colors.green),
                ),
              ),
              SizedBox(height: 16),
              Image.network(
                'https://via.placeholder.com/150',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class MechanicProfilesPage extends StatelessWidget {
  final List<Map<String, String>> mechanics = [
    {
      'name': 'John Doe',
      'specialty': 'Engine Repair',
      'rating': '4.5',
    },
    {
      'name': 'Jane Smith',
      'specialty': 'Transmission Repair',
      'rating': '4.7',
    },
    {
      'name': 'Mike Johnson',
      'specialty': 'Brake Repair',
      'rating': '4.8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanic Profiles'),
      ),
      body: ListView.builder(
        itemCount: mechanics.length,
        itemBuilder: (context, index) {
          final mechanic = mechanics[index];
          return Card(
            child: ListTile(
              title: Text(mechanic['name']!),
              subtitle: Text('${mechanic['specialty']} - Rating: ${mechanic['rating']}'),
              leading: CircleAvatar(
                child: Text(mechanic['name']![0]),
              ),
              onTap: () {
                // Handle mechanic profile tap
              },
            ),
          );
        },
      ),
    );
  }
}
