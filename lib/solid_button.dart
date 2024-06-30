import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap; // Function to execute when tapped
  final Color backgroundColor; // Background color of the button
  final String buttonText; // Text displayed on the button

  const CustomButton({
    super.key,
    required this.onTap,
    this.backgroundColor = AppColors.primaryColor, // Default background color
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Responsive width
        height: 50, // Fixed height
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          // Centering the text inside the button
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
