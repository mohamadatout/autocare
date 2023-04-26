import 'package:flutter/material.dart';

class inputField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final bool pass;

  const inputField(
      {required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.pass});

  @override
  State<inputField> createState() => _inputFieldState();
}

class _inputFieldState extends State<inputField> {
  var _isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 50,
      child: TextField(
        // maxLength: 500,
        obscureText: _isPressed,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: "Sora"),
          label: Text(
            widget.hintText,
            style: const TextStyle(fontFamily: "sora"),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          suffixIcon: widget.pass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                  icon: Icon(
                      _isPressed ? Icons.visibility : Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }
}
