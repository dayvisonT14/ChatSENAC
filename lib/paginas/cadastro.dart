import 'package:flutter/material.dart';

import '../utilitarios/tipografia.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back)),
            ),
            SizedBox(height: 32),

            // Titulos
            Text("Cadastre-se", style: Tipografia.h1),
            SizedBox(height: 12),
            Text("Crie uma conta e continue!", style: Tipografia.subtitulo),
            SizedBox(height: 32),

            // Campos
            Text("Nome Completo", style: Tipografia.subtitulo),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Email", style: Tipografia.subtitulo),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Senha", style: Tipografia.subtitulo),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Text("Confirmar Senha", style: Tipografia.subtitulo),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),

            // Botões
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("Cadastrar", style: Tipografia.subtitulo),
            ),
          ],
        ),
      ),
    );
  }
}
