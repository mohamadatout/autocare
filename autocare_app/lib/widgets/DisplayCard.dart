import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DisplayCard extends StatelessWidget {
  final String imgURL;
  final String text;
  final double imgWidth;
  final double imgHeight;

  const DisplayCard({
    super.key,
    required this.text,
    required this.imgURL,
    required this.imgHeight,
    required this.imgWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imgURL,
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
