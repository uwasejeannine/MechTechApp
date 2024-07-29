import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'package:widgetassignment/custom_textField.dart';
import 'package:widgetassignment/login_page.dart';
import 'package:widgetassignment/solid_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _successMessage;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
      _successMessage = null;
    });

    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        setState(() {
          _successMessage = 'Registration successful!';
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          _showErrorDialog('The Email is already in use');
        } else if (e.code == 'weak-password') {
          _showErrorDialog('Weak password');
        } else {
          _showErrorDialog('Registration failed: ${e.message}');
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    'Hi there! Welcome',
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
                    'Please add your information to register...',
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
                        controller: _nameController,
                        labelText: 'Full Name',
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Please enter your name';
                          } else if (name.length < 6) {
                            return 'Name should be at least 6 characters';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: _emailController,
                        labelText: 'Email',
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
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: 'National ID',
                        validator: (nationalId) {
                          if (nationalId == null || nationalId.isEmpty) {
                            return 'Please enter your national ID';
                          } else if (nationalId.length < 12) {
                            return 'National ID should be at least 12 characters';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: 'Telephone',
                        validator: (phoneNumber) {
                          if (phoneNumber == null || phoneNumber.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (phoneNumber.length < 10) {
                            return 'Phone number should be at least 10 characters';
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
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      onTap: _register,
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
                    'Already a member?',
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
                        builder: (context) => const LoginPage(),
                      ));
                    },
                    child: const Text(
                      'Sign In',
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
      ),
    );
  }
}
