import 'package:app/avatar.dart';
import 'package:app/button.dart';
import 'package:flutter/material.dart';

import 'Input.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: HomePage(
        key: UniqueKey(),
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Avatar(key: UniqueKey()),
            Input(
              key: UniqueKey(),
              text: "Login",
              controller: _loginEditingController,
              isPassword: false,
            ),
            Input(
              key: UniqueKey(),
              text: "Password",
              controller: _passwordEditingController,
              isPassword: true,
            ),
            Button(
              key: UniqueKey(),
              text: "Cadastro",
            )
          ],
        ),
      ),
    );
  }
}
