import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {

  // valida e-mail
  String? validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-mail não pode ficar em branco';
    }
    
    if (!email.contains('@') || !email.contains('.com')) {
      return 'Insira um e-mail válido';
    }
    
    return null;
  }

  // valida senha
  String? validarSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Senha não pode ficar em branco';
    }
    
    return null;
  }

  // quando clicar no botão de login vai verificar
  Future<void> fazerLogin(BuildContext context, String email, String senha) async {
    // valida e-mail
    final erroEmail = validarEmail(email);
    if (erroEmail != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroEmail)),
      );
      return;
    }

    // valida senha
    final erroSenha = validarSenha(senha);
    if (erroSenha != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroSenha)),
      );
      return;
    }

    try {
      // Simulando uma chamada de API
      await Future.delayed(const Duration(seconds: 1));

      // se chegou aqui, ta tudo certo
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );
        
        // navega para a tela principal
        Navigator.pushReplacementNamed(context, 'principal');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao fazer login: ${e.toString()}')),
        );
      }
    }
  }
}