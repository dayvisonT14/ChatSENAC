import 'package:flutter/material.dart';
import 'package:primeiro_app/paginas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tópico 2: Remove a faixa de debug
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Login()),
      ),
    );
  }
}
