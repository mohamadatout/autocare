import 'package:flutter/material.dart';

class continueWith extends StatelessWidget {
  final String imgPath;
  final String withApp;

  const continueWith({super.key, required this.imgPath, required this.withApp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imgPath,
            height: 25,
          ),
          Text(
            "Continue with $withApp",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
