import 'package:flutter/material.dart';
import 'package:widgetassignment/custom_textField.dart';
import 'mechanic_schedule.dart'; // Import the MechanicSchedulPage

class ReschedulePage extends StatelessWidget {
  const ReschedulePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white, // Set overall background color
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
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                        "images/five.png"), // Replace with actual image
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Mutabazi John',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Request A Mechanic',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Add your information to request ' + 'a mechanic',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: SizedBox(
                      width: size.width * .8,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            labelText: 'Full Name',
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return 'Please enter your name';
                              } else if (name.length < 6) {
                                return 'Name should be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            labelText: 'Phone Number',
                            validator: (phoneNumber) {
                              if (phoneNumber == null || phoneNumber.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (phoneNumber.length < 10) {
                                return 'Phone number should be at least 10 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            labelText: 'Email Address',
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'Please enter an email address';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(email)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            labelText: 'Location',
                            validator: (location) {
                              if (location == null || location.isEmpty) {
                                return 'Please enter your location';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            labelText: 'Describe Issue',
                            validator: (issue) {
                              if (issue == null || issue.isEmpty) {
                                return 'Please describe the issue';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to MechanicSchedulPage when button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MechanicSchedulPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2596BE),
                      minimumSize: Size(size.width * 0.8, 50),
                    ),
                    child: Text(
                      'Send Request',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
}

void main() {
  runApp(MaterialApp(
    home: ReschedulePage(),
  ));
}
