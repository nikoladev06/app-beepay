import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111112), // fundo dark
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'logoappintegra.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

              // E-mail
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              // Senha
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),

              // Botão Login
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // lógica de login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF45b5b7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Texto Cadastrar
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Não possui uma conta? ",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "Cadastre-se",
                        style: const TextStyle(
                          color: Color(0xFF45b5b7), // cor de destaque, tipo link
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline, // opcional
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navegar para a tela de cadastro
                            Navigator.pushNamed(context, 'cadastrar');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
