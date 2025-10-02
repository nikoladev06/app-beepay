import 'package:flutter/material.dart';

class RecuperarsenhaController extends ChangeNotifier{

  //valida email

  String? validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-mail não pode ficar em branco';
    }
    
    if (!email.contains('@') || !email.contains('.com')) {
      return 'Insira um e-mail válido';
    }
    
    return null;
  }

  void recuperar(BuildContext context, String email) {

    //valida email
    final erroEmail = validarEmail(email);
    if (erroEmail != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroEmail)),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('E-mail enviado, verifique e redefina a senha')),
    );
  }
}