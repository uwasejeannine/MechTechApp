import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'mech_tech.dart';

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
