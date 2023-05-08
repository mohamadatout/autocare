import 'package:autocare_app/widgets/oneChat.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Map> chats = [
    {
      "name": "Nour Garage",
      "lastMessage": "Okay deal",
      "time": "15 min",
      "imgURL": "assets/bmw.jpg",
    },
    {
      "name": "Mhmd Atout Store",
      "lastMessage": "No worries",
      "time": "1 hr",
      "imgURL": "assets/bmw.jpg",
    },
    {
      "name": "Taha Garage",
      "lastMessage": "How much does it cost ?",
      "time": "2 d",
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
