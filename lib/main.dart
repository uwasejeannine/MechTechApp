import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

void main() {
  runApp(const MechTechApp());
}

class MechTechApp extends StatelessWidget {
  const MechTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MechTech Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MechTechHomePage(),
    );
  }
}

class MechTechHomePage extends StatefulWidget {
  const MechTechHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MechTechHomePageState createState() => _MechTechHomePageState();
}

class _MechTechHomePageState extends State<MechTechHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF2596BE),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://example.com/images/MechTech1.png', // Use a valid image URL
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome back to MechTech',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
