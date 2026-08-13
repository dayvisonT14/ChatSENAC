import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String nomeUsuario;

  const Dashboard({
    super.key,
    required this.nomeUsuario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatSENAC"),
      ),
      body: Center(
        child: Text(
          "Bem-vindo, $nomeUsuario!",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}