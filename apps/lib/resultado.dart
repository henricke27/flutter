import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String combustivel;
  final double percentual;

  const Resultado(
      {super.key, required this.combustivel, required this.percentual});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      elevation: 16.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Resultado: $percentual%\nAbastecer com $combustivel",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
