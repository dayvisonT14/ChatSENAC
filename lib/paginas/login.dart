import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [FlutterLogo(size: 18), Text("ChatSENAC")]),
            SizedBox(height: 32),

            // Titulos
            Text("Entre na sua Conta", style: Tipografia.h1),
            SizedBox(height: 12),
            Text(
              "Coloque o seu email e senha para logar",
              style: Tipografia.subtitulo,
            ),
            SizedBox(height: 32),

            // Campos
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
            InkWell(
              onTap: () {},
              child: Text(
                "Esqueceu a senha?",
                textAlign: TextAlign.right,
                style: Tipografia.link,
              ),
            ),
            SizedBox(height: 24),
            // Botões
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
              child: Text("Entrar", style: Tipografia.subtitulo),
            ),
            SizedBox(height: 24),
            Text("Ou", textAlign: TextAlign.center),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Image.asset("assets/imagens/google-icon.png", height: 18),
                  Text("Continuar com Google", style: Tipografia.subtitulo),
                ],
              ),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Image.asset("assets/imagens/facebook-icon.png", height: 18),
                  Text("Continuar com Facebook", style: Tipografia.subtitulo),
                ],
              ),
            ),
            SizedBox(height: 54),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: [
                Text("Não tem uma conta?", style: Tipografia.subtitulo),
                InkWell(child: Text("Cadastre-se", style: Tipografia.link)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
