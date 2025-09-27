import 'package:flutter/material.dart';

class CadastrarController extends ChangeNotifier {
  // valida do e-mail
  String? validarEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-mail não pode ficar em branco';
    }
    
    if (!email.contains('@')) {
      return 'E-mail deve conter @ e ser válido';
    }
    
    return null;
  }

  // valida nome de usuário
  String? validarNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'Nome de usuário não pode ficar em branco';
    }
    
    if (nome.length < 3) {
      return 'Nome deve ter pelo menos 3 caracteres';
    }
    
    return null;
  }

  // valida da senha
  String? validarSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Senha não pode ficar em branco';
    }
    
    if (senha.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    
    return null;
  }

  // valida confirmação de senha
  String? validarConfirmacaoSenha(String? senha, String? confirmacao) {
    if (confirmacao == null || confirmacao.isEmpty) {
      return 'Confirme sua senha';
    }
    
    if (senha != confirmacao) {
      return 'As senhas não coincidem';
    }
    
    return null;
  }

  // valida do telefone
  String? validarTelefone(String? telefone) {
    if (telefone == null || telefone.isEmpty) {
      return 'Telefone não pode ficar em branco';
    }
    
    // remove caracteres não numéricos
    final telefoneLimpo = telefone.replaceAll(RegExp(r'[^\d]'), '');
    
    if (telefoneLimpo.length < 10) {
      return 'Telefone deve ter pelo menos 10 dígitos';
    }
    
    return null;
  }

  // botão de cadastro cadastro
  void fazerCadastro(BuildContext context, {
    required String email,
    required String nome,
    required String senha,
    required String confirmacaoSenha,
    required String telefone,
  }) {
    // valida e-mail
    final erroEmail = validarEmail(email);
    if (erroEmail != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroEmail)),
      );
      return;
    }

    // valida nome
    final erroNome = validarNome(nome);
    if (erroNome != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroNome)),
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

    // valida confirmação de senha
    final erroConfirmacao = validarConfirmacaoSenha(senha, confirmacaoSenha);
    if (erroConfirmacao != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroConfirmacao)),
      );
      return;
    }

    // valida telefone
    final erroTelefone = validarTelefone(telefone);
    if (erroTelefone != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erroTelefone)),
      );
      return;
    }

    // se chegou aqui, ta tudo certo
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso!')),
    );
    
    // navega para o login
    Navigator.pushReplacementNamed(context, 'login');
  }
}
