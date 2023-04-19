import 'package:app/view/avatar.dart';
import 'package:app/view/button.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

  String? login;
  String? password;
  int idContador = 1;

  var open = () async {
    return openDatabase(join(await getDatabasesPath(), "users.db"),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, login TEXT, password TEXT)');
    }, version: 1);
  };

  currentLogin() {
    String? text = _loginEditingController.text;
    if (text.isNotEmpty) {
      password = text;
    }
  }

  currentPassword() {
    String? text = _passwordEditingController.text;
    if (text.isNotEmpty) {
      password = text;
    }
  }

  save() async {
    Database db = await open();
    Map<String, dynamic> userData = {
      'id': idContador++,
      'login': '$login',
      'password': '$password',
    };
    var newId = await db.insert('user', userData);
    setState(() {
      idContador = newId;
    });
    db.close();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
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
                onPressed: save,
                key: UniqueKey(),
                text: "Cadastro",
              )
            ],
          ),
        ),
      ),
    );
  }
}
