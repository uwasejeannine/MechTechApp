import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const SplashScreen(),
    );
  }
}
