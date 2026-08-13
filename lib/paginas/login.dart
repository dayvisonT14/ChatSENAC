import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primeiro_app/paginas/cadastro.dart';
import 'package:primeiro_app/paginas/dashboard.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();

  Icon getSenhaInvisivel() {
    if (isObscure) {
      return const Icon(Icons.visibility_off);
    }

    return const Icon(Icons.visibility);
  }

  bool isObscure = true;

  void trocarObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  Future fazerLogin() async {
    var url = Uri.http("10.112.4.33", "api/login");

    var resposta = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": emailControlador.text,
        "senha": senhaControlador.text,
      }),
    );

    if (resposta.statusCode != 200) {
      var dados = jsonDecode(resposta.body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${dados["message"]}"),
        ),
      );

      return;
    }

    // Converte o JSON recebido pela API
    var dados = jsonDecode(resposta.body);

    // Pega o nome do usuário
    var nomeUsuario = dados["nomeUsuario"] ?? "Usuário";

    // Vai para o Dashboard passando o nome
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Dashboard(nomeUsuario: nomeUsuario),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: const [
                  FlutterLogo(size: 18),
                  SizedBox(width: 8),
                  Text("ChatSENAC"),
                ],
              ),

              const SizedBox(height: 32),

              Text("Entre na sua conta", style: Tipografia.h1),

              const SizedBox(height: 12),

              Text(
                "Coloque o seu email e senha para logar",
                style: Tipografia.subtitulo,
              ),

              const SizedBox(height: 32),

              const Text("Email"),

              const SizedBox(height: 4),

              TextField(
                controller: emailControlador,
                decoration: InputDecoration(
                  hintText: "exemplo@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text("Senha"),

              const SizedBox(height: 4),

              TextField(
                controller: senhaControlador,
                obscureText: isObscure,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: trocarObscure,
                    icon: getSenhaInvisivel(),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              InkWell(
                onTap: () {},
                child: Text(
                  "Esqueceu a senha?",
                  style: Tipografia.link,
                  textAlign: TextAlign.right,
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: fazerLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "ou",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/imagens/google-icon.png", height: 18),
                      const SizedBox(width: 10),
                      Text(
                        "Continuar com o Google",
                        style: Tipografia.subtitulo,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/imagens/facebook-icon.png",
                        height: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Continuar com o Facebook",
                        style: Tipografia.subtitulo,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 54),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem uma conta? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Cadastro()),
                      );
                    },
                    child: Text("Cadastre-se", style: Tipografia.link),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}