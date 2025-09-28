import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../controller/cadastrar_controller.dart';

class CadastrarView extends StatefulWidget{
  const CadastrarView({super.key});

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

class _CadastrarViewState extends State<CadastrarView> {
  final CadastrarController _controller = CadastrarController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmacaoSenhaController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111112),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'logoappintegra.png',
                height: 150,
                fit: BoxFit.contain
              ),


              const SizedBox(height: 30),


              //email

              TextField(
                 controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),

              //nome user

              TextField(
                controller: _nomeController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nome de Usuário',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              // senha

              TextField(
                controller: _senhaController,
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
              const SizedBox(height: 16),

              //confirma senha

              TextField(
                controller: _confirmacaoSenhaController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Confirme a senha',
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
              const SizedBox(height: 16),

              //telefone

              TextField(
                controller: _telefoneController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Telefone',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.phone, color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),

               SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.fazerCadastro(
                      context,
                      email: _emailController.text,
                      nome: _nomeController.text,
                      senha: _senhaController.text,
                      confirmacaoSenha: _confirmacaoSenhaController.text,
                      telefone: _telefoneController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF45b5b7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Já possui uma conta? ",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "Entre agora",
                        style: const TextStyle(
                          color: Color(0xFF45b5b7), // cor de destaque, tipo link
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline, // opcional
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navegar para a tela de cadastro
                            Navigator.pushNamed(context, 'login');
                          },
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )
        )
        )
    );
  }
   @override
  void dispose() {
    _emailController.dispose();
    _nomeController.dispose();
    _senhaController.dispose();
    _confirmacaoSenhaController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }
}