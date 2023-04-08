import 'dart:ffi';

import 'package:apps/resultado.dart';
import 'package:flutter/material.dart';

class SupplyApp extends StatefulWidget {
  const SupplyApp({super.key});

  @override
  State<SupplyApp> createState() => _SupplyAppState();
}

class _SupplyAppState extends State<SupplyApp> {
  final TextEditingController _alcoolTextEditingController =
      TextEditingController();

  final TextEditingController _gasolinaTextEditingController =
      TextEditingController();

  double valorAlcool = 0.0;
  double valorGasolina = 0.0;
  double percentual = -1.0;

  void calcularValor() {
    if (valorAlcool > 0.0 && valorGasolina > 0.0) {
      setState(() {
        percentual = double.parse(
            (valorAlcool / valorGasolina * 100).toStringAsFixed(2));
      });
    }
  }

  void _latestAlcoolValue() {
    String text = _alcoolTextEditingController.text;
    if (text.isNotEmpty) {
      setState(() {
        double? val = double.tryParse(text);
        val != null ? valorAlcool = val : Void;
      });
    }
  }

  void _latestGasolinaValue() {
    String text = _gasolinaTextEditingController.text;
    if (text.isNotEmpty) {
      setState(() {
        double? val = double.tryParse(text);
        val != null ? valorGasolina = val : Void;
      });
    }
  }

  @override
  void initState() {
    _alcoolTextEditingController.addListener(_latestAlcoolValue);
    _gasolinaTextEditingController.addListener(_latestGasolinaValue);
    super.initState();
  }

  @override
  void dispose() {
    _alcoolTextEditingController.dispose();
    _gasolinaTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
            image: AssetImage("assets/petrol-pump.png"),
            width: 200.0,
          ),
          SizedBox(
            height: 72.0,
            width: 128.0,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                label: Text("Valor do álcool"),
              ),
              controller: _alcoolTextEditingController,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 72.0,
            width: 128.0,
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                label: Text("Valor da gasolina"),
              ),
              controller: _gasolinaTextEditingController,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 48.0,
            width: 128.0,
            child: ElevatedButton(
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(16.0),
              ),
              onPressed: calcularValor,
              child: const Text("Calcular"),
            ),
          ),
          Container(
            child: percentual == -1
                ? null
                : percentual >= 70
                    ? Resultado(
                        key: UniqueKey(),
                        combustivel: "álcool",
                        percentual: percentual,
                      )
                    : Resultado(
                        key: UniqueKey(),
                        combustivel: "gasolina",
                        percentual: percentual,
                      ),
          )
        ],
      ),
    );
  }
}
