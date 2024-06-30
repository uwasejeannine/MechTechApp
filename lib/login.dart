import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'package:widgetassignment/custom_textField.dart';
import 'package:widgetassignment/solid_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: size.width * .4,
                top: 35,
              ),
              child: Image.asset(
                "images/logo_min.png",
                width: size.width * .6,
                height: 30,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8), // Adjust the spacing as needed
            const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please add your information to continue...',
                  style: TextStyle(
                    color: AppColors.slightDark,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              child: SizedBox(
                width: size.width * .8,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: 'Email',
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter an email address';
                        } else if ((!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(email))) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Password',
                      obscureText: true,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter a password';
                        } else if (password.length < 6) {
                          return 'Password must be at least 6 characters long';
                        } else if (!password.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        } else if (!password.contains(RegExp(r'[a-z]'))) {
                          return 'Password must contain at least one lowercase letter';
                        } else if (!password.contains(RegExp(r'[0-9]'))) {
                          return 'Password must contain at least one digit';
                        }
                        return null;
                      },
                      showSuffixIcon: true,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                // Navigate to a new page or perform an action
                print("Button tapped");
              },
              backgroundColor: AppColors.primaryColor,
              buttonText: 'Sign Up',
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap: () {},
              backgroundColor: AppColors.textDark,
              buttonText: 'Continue with Google',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an Account?',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
