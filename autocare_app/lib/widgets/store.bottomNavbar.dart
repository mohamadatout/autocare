import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (value) {
        print(value);
      },
      backgroundColor: Colors.transparent,
      color: const Color.fromARGB(255, 187, 50, 51),
      animationDuration: const Duration(milliseconds: 500),
      items: const [
        Icon(
          Icons.home,
          color: Colors.white,
        ),
        Icon(
          Icons.message,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          color: Colors.white,
        ),
      ],
    );
  }
}
