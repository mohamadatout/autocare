import 'package:autocare_app/screens/Chats.screen.dart';
import 'package:autocare_app/screens/Profile.screen.dart';
import 'package:autocare_app/screens/StoreHome.screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class StoreMainScreen extends StatefulWidget {
  const StoreMainScreen({super.key});

  @override
  State<StoreMainScreen> createState() => _StoreMainScreenState();
}

class _StoreMainScreenState extends State<StoreMainScreen> {
  var index = 0;

  List pages = [
    StoreHomePage(),
    ChatsScreen(),
    ProfilePage(),
  ];

  final bottomNavBarItems = <Widget>[
    Icon(Icons.home, color: Colors.white),
    Icon(Icons.message, color: Colors.white),
    Icon(Icons.person, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          index == 0
              ? "Home"
              : index == 1
                  ? "Chats"
                  : "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 187, 50, 51),
        animationDuration: const Duration(milliseconds: 500),
        items: bottomNavBarItems,
        height: 70,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
