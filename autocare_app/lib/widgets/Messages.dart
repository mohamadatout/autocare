import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Messages extends StatelessWidget {
  List<Map> chats = [
    {"messageContent": "Hii", "messageType": "sender"},
    {"messageContent": "How are you", "messageType": "sender"},
    {"messageContent": "Helooo", "messageType": "reciever"},
    {"messageContent": "I'm fine", "messageType": "reciever"},
    {
      "messageContent":
          "I just want tot ask if I can pass by at 5 to check on my car",
      "messageType": "sender"
    },
    {"messageContent": "Yeah sure, your welcome :)", "messageType": "reciever"},
  ];
  // const OneMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Align(
              alignment: chats[index]["messageType"] == "reciever"
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 130),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: chats[index]["messageType"] == "reciever"
                      ? Color.fromARGB(255, 246, 246, 246)
                      : Color.fromARGB(255, 187, 50, 51),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  chats[index]["messageContent"],
                  style: chats[index]["messageType"] == "sender"
                      ? TextStyle(fontSize: 18, color: Colors.white)
                      : TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
