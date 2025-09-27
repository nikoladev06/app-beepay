import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {

  // valida e-mail
  String? validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-mail não pode ficar em branco';
    }
    
    if (!email.contains('@')) {
      return 'E-mail deve conter @ e ser válido';
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
  void fazerLogin(BuildContext context, String email, String senha) {
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

    // se chegou aqui, ta tudo certo
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login realizado com sucesso!')),
    );
    
    // navega para a tela principal
    Navigator.pushReplacementNamed(context, 'principal');
  }
}