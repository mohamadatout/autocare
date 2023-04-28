import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double paddingVertical;
  final double paddingHorizantal;

  const Button({
    super.key,
    required this.onTap,
    required this.text,
    required this.paddingVertical,
    required this.paddingHorizantal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizantal),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "sora",
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
