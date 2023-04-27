import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 187, 50, 51),
      body: Center(
        child: Text(
          "AutoCare",
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontFamily: "Race",
          ),
        ),
      ),
    );
  }
}
