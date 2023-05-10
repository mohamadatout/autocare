import 'package:autocare_app/widgets/Messages.dart';
import 'package:autocare_app/widgets/SendMessageBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: const Text(
          "Nour's Workshop",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(child: Messages()),
          SendMesssageBar(),
        ],
      ),
    );
  }
}
