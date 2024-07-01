import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'package:widgetassignment/signup.dart';
import 'package:widgetassignment/signin.dart';
import 'package:widgetassignment/solid_button.dart';

class MechTechHomePage extends StatefulWidget {
  const MechTechHomePage({super.key});

  @override
  State<MechTechHomePage> createState() => _MechTechHomePageState();
}

class _MechTechHomePageState extends State<MechTechHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                width: size.width * .6,
                height: 150,
              ),
              const SizedBox(height: 16),
              const Text(
                'You are one stop away from getting help from qualified  mechanics near you!...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 25),
              CustomButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const RegisterPage(), // Replace with your SignupPage class
                  ));
                },
                backgroundColor: AppColors.primaryColor,
                buttonText: 'Sign Up',
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                backgroundColor: AppColors.textDark,
                buttonText: 'Sign In',
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
