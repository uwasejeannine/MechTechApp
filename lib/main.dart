import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:widgetassignment/color_schema.dart';
import 'mech_tech.dart';
=======
import 'signup.dart';
import 'mechanic_book.dart';
>>>>>>> 65cf92e (add the change of name)

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
        primaryColor: AppColors.primaryColor,
        fontFamily: 'StudioFeixenSansTRIAL',
      ),
      debugShowCheckedModeBanner: false,
      home: const MechTechHomePage(),
    );
  }
}
