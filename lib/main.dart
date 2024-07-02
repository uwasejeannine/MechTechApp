import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart'; // Assuming you have a color_schema.dart for colors
import 'splash_screen.dart'; // Import your splash screen file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MechTechApp());
}

class MechTechApp extends StatelessWidget {
  const MechTechApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MechTech Project',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor, // Your primary color
        fontFamily: 'StudioFeixenSansTRIAL',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
