import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';
import 'package:widgetassignment/notification_page.dart';
import 'package:widgetassignment/home_page.dart';
import 'package:widgetassignment/Mechanics.dart';
import 'package:widgetassignment/profile_page.dart';
import 'package:widgetassignment/support_page.dart'; // Ensure this import matches your actual file name

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int currentIndex = 2;
  final pages = [
    const SupportPage(),
    const HomePage(),
    const MechanicsPage(),
    const NotificationPage(), // Ensure this corresponds to the correct page
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.help,
        size: 25,
      ),
      const Icon(
        Icons.work,
        size: 25,
      ),
      const Icon(
        Icons.home,
        size: 25,
      ),
      const Icon(
        Icons.notifications,
        size: 25,
      ),
      const Icon(
        Icons.perm_identity,
        size: 25,
      ),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          color: AppColors.textDark,
          buttonBackgroundColor: AppColors.textDark,
          index: currentIndex,
          items: items,
          height: 65,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (currentIndex) =>
              setState(() => this.currentIndex = currentIndex),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
