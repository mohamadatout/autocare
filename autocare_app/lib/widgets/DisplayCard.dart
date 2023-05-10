import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DisplayCard extends StatelessWidget {
  final String imgURL;
  final String text;
  final double imgWidth;
  final double imgHeight;
  final double containerHeight;

  const DisplayCard({
    super.key,
    required this.text,
    required this.imgURL,
    required this.imgHeight,
    required this.imgWidth,
    required this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.memory(
              base64Decode(imgURL),
              width: imgWidth,
              height: imgHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "sora",
            ),
          )
        ],
      ),
    );
  }
}
