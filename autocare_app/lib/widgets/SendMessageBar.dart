import 'package:autocare_app/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:autocare_app/widgets/inputField.dart';

class SendMesssageBar extends StatefulWidget {
  @override
  State<SendMesssageBar> createState() => _SendMesssageBarState();
}

class _SendMesssageBarState extends State<SendMesssageBar> {
  final _messageController = TextEditingController();
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void submitMessage() {
    final enteredText = _messageController.text;
    if (enteredText.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore.instance.collection("chat").add({
      "text": enteredText,
      "createdAt": Timestamp.now(),
      "userId": user.uid,
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(bottom: 25, top: 5),
          height: 80,
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  submitMessage();
                },
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 18,
                ),
                backgroundColor: Color.fromARGB(255, 187, 50, 51),
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
