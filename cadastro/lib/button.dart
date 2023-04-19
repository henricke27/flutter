import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String text;
  Button({super.key, required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 48,
      margin: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(widget.text),
      ),
    );
  }
}
