import 'package:flutter/material.dart';

class inputField extends StatefulWidget {
  final controller;
  final String? hintText;
  final bool obscureText;
  final bool pass;
  final bool showBorder;
  Widget? prefixIcon;
  Widget? sufixIcon;
  Color? fillColor;
  TextInputType? keyboardType;

  inputField(
      {required this.controller,
      this.hintText,
      this.prefixIcon,
      this.sufixIcon,
      this.obscureText = false,
      this.pass = false,
      this.showBorder = true,
      this.fillColor,
      this.keyboardType});

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.fillColor,
      ),
      child: TextFormField(
        // maxLength: 500,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _isPressed && widget.obscureText,

        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffix: widget.sufixIcon,
          label: widget.hintText != null
              ? Text(
                  widget.hintText!,
                  style: const TextStyle(fontFamily: "sora"),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide:
                widget.showBorder ? const BorderSide() : BorderSide.none,
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
