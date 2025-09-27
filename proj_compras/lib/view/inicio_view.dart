import 'package:flutter/material.dart';

class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111112), // Fundo preto (dark)
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 150), // Espaço superior

                // Logo
                Image.asset(
                  'logoappintegra.png', // ajuste o path conforme seu projeto
                  height: 225,
                  width: 225,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),

                // Subtítulo
                const Text(
                  'Descubra. Participe. Integre-se!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Botão Login
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF45b5b7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Login',
                    style: TextStyle(fontSize: 20)),
                  ),
                ),

                const SizedBox(height: 16),

                // Botão Cadastrar
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'cadastrar');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Cadastrar',
                    style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
