import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(20),
              width: 256,
              child: Image.asset("assets/avatar.png"),
            );
  }
}