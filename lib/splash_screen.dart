import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgetassignment/color_schema.dart';
import 'package:widgetassignment/mech_tech.dart';

import 'Onboarding/onboarding_view.dart';
import 'mech_tech_details.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Future<bool> _checkOnboardingStatus;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_animationController);

    _checkOnboardingStatus = _loadFromPrefs();
    _navigateAfterAnimation();
  }

  Future<bool> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding') ?? false;
  }

  void _navigateAfterAnimation() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _checkOnboardingStatus.then((isOnboardingCompleted) {
          if (isOnboardingCompleted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MechTechHomePage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingPages()),
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'images/logo.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
