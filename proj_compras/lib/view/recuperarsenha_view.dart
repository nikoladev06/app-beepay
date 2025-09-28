import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../controller/recuperarsenha_controller.dart';

class RecuperarsenhaView extends StatefulWidget {
  const RecuperarsenhaView({super.key});

  @override
  State<RecuperarsenhaView> createState() => _RecuperarsenhaViewState();
}

class _RecuperarsenhaViewState extends State<RecuperarsenhaView> {
    final RecuperarsenhaController _controller = RecuperarsenhaController();
    final TextEditingController _emailController = TextEditingController();


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
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'E-mail para recuperação',
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

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.recuperar(
                      context, 
                      _emailController.text, 
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
                    'Enviar e-mail',
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
                    text: "Recuperou? ",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "Entre com a nova senha",
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

  //limpar os recursos quando o widget é removido da tela.
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}