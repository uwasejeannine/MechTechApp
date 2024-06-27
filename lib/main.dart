import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        //title: Text('MechTech Project'), // Commented out to remove the title
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF2596BE),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                '../images/MechTech 1.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 16),
              Text(
                'Welcome back to MechTech',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Login'),
              ),
              SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
      // Removed bottomNavigationBar and floatingActionButton
    );
  }
}
