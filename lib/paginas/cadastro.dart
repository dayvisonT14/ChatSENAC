import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';
import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class Senha {
  bool invisivel = true;

  void trocarVisibilidade() {
    invisivel = !invisivel;
  }
}

class _CadastroState extends State<Cadastro> {
  final nomeControlador = TextEditingController();
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();
  final confirmarSenhaControlador = TextEditingController();

  Senha isSenhaObscure = Senha();
  Senha isConfirmarSenhaObscure = Senha();

  bool carregando = false;

  // ==============================
  // FAZER CADASTRO
  // ==============================

  Future<void> fazerCadastro() async {
    // Verifica campos vazios
    if (nomeControlador.text.trim().isEmpty ||
        emailControlador.text.trim().isEmpty ||
        senhaControlador.text.isEmpty ||
        confirmarSenhaControlador.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos.")),
      );

      return;
    }

    // Verifica se as senhas são iguais
    if (senhaControlador.text != confirmarSenhaControlador.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("As senhas não são iguais.")),
      );

      return;
    }

    // Evita vários cliques
    if (carregando) {
      return;
    }

    setState(() {
      carregando = true;
    });

    try {
      final url = Uri.http("10.112.4.33", "/api/cadastro");

      final resposta = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "nome": nomeControlador.text.trim(),
          "email": emailControlador.text.trim(),
          "senha": senhaControlador.text,
        }),
      );

      Map<String, dynamic> dados = {};

      try {
        dados = jsonDecode(resposta.body);
      } catch (_) {
        dados = {};
      }

      if (!mounted) return;

      // ==============================
      // ERRO NO CADASTRO
      // ==============================

      if (resposta.statusCode != 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              dados["message"] ?? "Não foi possível realizar o cadastro.",
            ),
          ),
        );

        setState(() {
          carregando = false;
        });

        return;
      }

      // ==============================
      // CADASTRO REALIZADO
      // ==============================

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cadastro realizado com sucesso!")),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Não foi possível conectar ao servidor.")),
      );

      setState(() {
        carregando = false;
      });
    }
  }

  // ==============================
  // DISPOSE
  // ==============================

  @override
  void dispose() {
    nomeControlador.dispose();
    emailControlador.dispose();
    senhaControlador.dispose();
    confirmarSenhaControlador.dispose();

    super.dispose();
  }

  // ==============================
  // TELA
  // ==============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==============================
              // BOTÃO VOLTAR
              // ==============================
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ==============================
              // TÍTULO
              // ==============================
              Text("Cadastrar-se", style: Tipografia.h1),

              const SizedBox(height: 12),

              Text(
                "Crie uma conta para continuar!",
                style: Tipografia.subtitulo,
              ),

              const SizedBox(height: 32),

              // ==============================
              // NOME
              // ==============================
              const Text("Nome"),

              const SizedBox(height: 4),

              TextField(
                controller: nomeControlador,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Seu nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ==============================
              // EMAIL
              // ==============================
              const Text("Email"),

              const SizedBox(height: 4),

              TextField(
                controller: emailControlador,
                keyboardType: TextInputType.emailAddress,
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

              const SizedBox(height: 19),

              // ==============================
              // SENHA
              // ==============================
              const Text("Senha"),

              const SizedBox(height: 4),

              TextField(
                controller: senhaControlador,
                obscureText: isSenhaObscure.invisivel,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSenhaObscure.trocarVisibilidade();
                      });
                    },
                    icon: Icon(
                      isSenhaObscure.invisivel
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ==============================
              // CONFIRMAR SENHA
              // ==============================
              const Text("Confirmar Senha"),

              const SizedBox(height: 4),

              TextField(
                controller: confirmarSenhaControlador,
                obscureText: isConfirmarSenhaObscure.invisivel,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isConfirmarSenhaObscure.trocarVisibilidade();
                      });
                    },
                    icon: Icon(
                      isConfirmarSenhaObscure.invisivel
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ==============================
              // BOTÃO REGISTRAR
              // ==============================
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: carregando ? null : fazerCadastro,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.blue.shade200,
                    disabledForegroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    elevation: 0,
                  ),
                  child: carregando
                      ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    "Registrar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}