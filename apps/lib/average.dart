import 'dart:ffi';

import 'package:flutter/material.dart';

class AverageApp extends StatefulWidget {
  const AverageApp({super.key});

  @override
  State<AverageApp> createState() => _AverageAppState();
}

class _AverageAppState extends State<AverageApp> {
  final TextEditingController _notaAtextEditingController =
      TextEditingController();
  final TextEditingController _notaBtextEditingController =
      TextEditingController();

  double currentNotaA = 0;
  double currentNotaB = 0;
  double average = -1;
  String? message;

  void _latestNotaA() {
    String notaA = _notaAtextEditingController.text;
    if (notaA.isNotEmpty) {
      double? val = double.tryParse(notaA);
      val != null ? currentNotaA = val : Void;
    }
  }

  void _latestNotaB() {
    String notaB = _notaBtextEditingController.text;
    if (notaB.isNotEmpty) {
      double? val = double.tryParse(notaB);
      val != null ? currentNotaB = val : Void;
    }
  }

  void _calcular() {
    if (currentNotaA >= 0 && currentNotaB >= 0) {
      setState(
        () {
          average = (currentNotaA + currentNotaB) / 2;
          average = double.parse(average.toStringAsFixed(2));
          if (average > 6.9) {
            message = "Aprovado";
          } else if (average > 4 && average < 7) {
            message = "Prova final";
          } else {
            message = "Reprovado";
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _notaAtextEditingController.addListener(_latestNotaA);
    _notaBtextEditingController.addListener(_latestNotaB);
  }

  @override
  void dispose() {
    super.dispose();
    _notaAtextEditingController.dispose();
    _notaBtextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Image(
          image: AssetImage("assets/test.png"),
          width: 200.0,
        ),
        SizedBox(
          height: 72.0,
          width: 128.0,
          child: TextField(
            controller: _notaAtextEditingController,
            decoration: const InputDecoration(
              labelText: "Primeira nota",
              labelStyle: TextStyle(color: Colors.green),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          height: 72.0,
          width: 128.0,
          child: TextField(
            controller: _notaBtextEditingController,
            decoration: const InputDecoration(
              labelText: "Segunda nota",
              labelStyle: TextStyle(color: Colors.green),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          height: 48.0,
          width: 128.0,
          child: ElevatedButton(
            onPressed: _calcular,
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(16.0),
            ),
            child: const Text("Calcular"),
          ),
        ),
        average != -1
            ? Card(
                elevation: 16.0,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Média aritmética: $average\n$message",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
