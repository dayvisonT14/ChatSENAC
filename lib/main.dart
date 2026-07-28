import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';

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

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Tópico 1: Rolagem e margens nas bordas
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo e Nome do App
          Row(
            children: [
              FlutterLogo(size: 18),
              const SizedBox(width: 8), // Tópico 3: Espaço horizontal
              Text("ChatSENAC"),
            ],
          ),
          const SizedBox(height: 32), // Tópico 3
          // Títulos
          Text("Entre na sua conta", style: Tipografia.h1),
          const SizedBox(height: 12), // Tópico 3
          Text(
            "Coloque o seu email e senha para logar",
            style: Tipografia.Subtitulo,
          ),
          const SizedBox(height: 32), // Tópico 3
          // Campo de Email
          Text("Email"),
          const SizedBox(height: 4), // Tópico 3
          TextField(
            // Tópico 4: Estilização do input
            decoration: InputDecoration(
              hintText: "exemplo@gmail.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16), // Tópico 3
          // Campo de Senha
          Text("Senha"),
          const SizedBox(height: 4), // Tópico 3
          TextField(
            // Tópico 5: Oculta a senha
            obscureText: true,
            decoration: InputDecoration(
              hintText: "••••••••",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 12), // Tópico 3
          // Esqueceu a senha
          InkWell(
            child: Text(
              "Esqueceu a senha?",
              style: Tipografia.link,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 24), // Tópico 3
          // Botão Entrar Principal
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
            ),
            child: const Text(
              "Entrar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16), // Tópico 3

          const Text(
            "ou",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16), // Tópico 3
          // Tópico 6: Botão Google com OutlinedButton e altura 48
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Colors.grey),
            ),
            child: const Text(
              "Continuar com o Google",
              style: TextStyle(color: Colors.black87),
            ),
          ),
          const SizedBox(height: 12), // Tópico 3
          // Tópico 6: Botão Facebook com OutlinedButton e altura 48
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Colors.grey),
            ),
            child: const Text(
              "Continuar com o Facebook",
              style: TextStyle(color: Colors.black87),
            ),
          ),
          const SizedBox(height: 54), // Tópico 3
          // Rodapé Cadastre-se
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Não tem uma conta? "),
              InkWell(
                onTap: () {},
                // TÓPICO 7 APLICADO AQUI: Correção ortográfica de "Cdastre-se" para "Cadastre-se"
                child: Text("Cadastre-se", style: Tipografia.link),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
