import 'package:autocare_app/widgets/oneChat.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Map> chats = [
    {
      "name": "Nour's Workshop",
      "lastMessage": "No Messages",
      "time": "10 min",
      "imgURL": "assets/bmw.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
