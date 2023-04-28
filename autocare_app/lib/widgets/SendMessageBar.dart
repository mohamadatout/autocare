import 'package:autocare_app/widgets/button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:autocare_app/widgets/inputField.dart';

class SendMesssageBar extends StatelessWidget {
  var messageController = TextEditingController();
  // const SendMesssageBar({super.key});

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
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
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
                onPressed: () {},
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
