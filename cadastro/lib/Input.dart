import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  String? text;
  bool isPassword;
  final TextEditingController controller;
  Input(
      {super.key,
      this.text = "",
      this.isPassword = false,
      required this.controller});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(10),
      width: screenWidth * 0.6,
      color: Colors.grey[300],
      child: TextField(
        obscureText: widget.isPassword,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.text,
        ),
      ),
    );
  }
}
