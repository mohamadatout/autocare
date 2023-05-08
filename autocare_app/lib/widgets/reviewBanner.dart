import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReviewBanner extends StatelessWidget {
  final String name;
  final String review;
  const ReviewBanner({super.key, required this.name, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(review),
    );
    ;
  }
}
