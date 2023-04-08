import 'dart:ffi';

import 'package:flutter/material.dart';

class BMIApp extends StatefulWidget {
  const BMIApp({super.key});

  @override
  State<BMIApp> createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  final TextEditingController _pesoTextEditingController =
      TextEditingController();

  final TextEditingController _alturaTextEditingController =
      TextEditingController();

  double pesoCurrent = -1;
  double alturaCurrent = -1;
  double bmi = -1;
  String message = " ";

  void latestPesoValue() {
    String peso = _pesoTextEditingController.text;
    if (peso.isNotEmpty) {
      double? val = double.tryParse(peso);
      val != null ? pesoCurrent = val : Void;
    }
  }

  void latestAlturaValue() {
    String altura = _alturaTextEditingController.text;
    if (altura.isNotEmpty) {
      double? val = double.tryParse(altura);
      val != null ? alturaCurrent = val : Void;
    }
  }

  void calcularBMI() {
    if (pesoCurrent > 0 && alturaCurrent > 0) {
      bmi = pesoCurrent / (alturaCurrent * alturaCurrent);

      setState(() {
        if (bmi < 18.5) {
          message = "Baixo Peso";
        } else if (bmi > 18.49 && bmi < 25) {
          message = "Normal";
        } else if (bmi > 24.99 && bmi < 30) {
          message = "Sobrepeso";
        } else {
          message = "Obeso";
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _pesoTextEditingController.addListener(latestPesoValue);
    _alturaTextEditingController.addListener(latestAlturaValue);
  }

  @override
  void dispose() {
    super.dispose();
    _pesoTextEditingController.dispose();
    _alturaTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 200,
          child: Image.asset("assets/bmi.png"),
        ),
        SizedBox(
          height: 48.0,
          width: 128.0,
          child: TextField(
            decoration: const InputDecoration(
              label: Text("Peso"),
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            controller: _pesoTextEditingController,
          ),
        ),
        SizedBox(
          height: 48.0,
          width: 128.0,
          child: TextField(
            decoration: const InputDecoration(
              label: Text("Altura"),
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            controller: _alturaTextEditingController,
          ),
        ),
        SizedBox(
          height: 48.0,
          width: 128.0,
          child: ElevatedButton(
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(16.0),
            ),
            onPressed: calcularBMI,
            child: const Text("Calcular"),
          ),
        ),
        bmi > 0
            ? Card(
                color: Colors.green,
                elevation: 16.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "$message",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
