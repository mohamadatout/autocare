import 'package:autocare_app/widgets/oneChat.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Map> chats = [
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
    {
      "name": "Mhmd Al Agha",
      "lastMessage": "Hii",
      "time": "15 min",
      "imgURL": "assets/google.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return oneChat(
            name: chats[index]["name"],
            lastMessage: chats[index]["lastMessage"],
            time: chats[index]["time"],
            imgURL: chats[index]["imgURL"],
          );
        },
      ),
    );
  }
}
