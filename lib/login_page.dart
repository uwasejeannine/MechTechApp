import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'package:widgetassignment/custom_textField.dart';
import 'package:widgetassignment/navigation.dart';
import 'package:widgetassignment/solid_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _successMessage;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _successMessage = null;
    });

    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        setState(() {
          _successMessage = 'Successfully logged in!';
        });
        // Navigate to the home or dashboard page after login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          _showErrorDialog('User not found');
        } else if (e.code == 'wrong-password') {
          _showErrorDialog('Incorrect password');
        } else {
          _showErrorDialog('Login failed: ${e.message}');
        }
      } catch (e) {
        _showErrorDialog('An error occurred: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi there! Welcome Back',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please enter your credentials to sign in...',
                  style: TextStyle(
                    color: AppColors.slightDark,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_successMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _successMessage!,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Form(
              key: _formKey,
              child: SizedBox(
                width: size.width * .8,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(email)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      showSuffixIcon: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              CustomButton(
                onTap: _login,
                backgroundColor: AppColors.primaryColor,
                buttonText: 'Sign In',
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
                  'Not yet registered?',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ));
                  },
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
