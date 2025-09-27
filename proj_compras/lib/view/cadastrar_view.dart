import 'package:flutter/material.dart';

class CadastrarView extends StatefulWidget{
  const CadastrarView({super.key});

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

class _CadastrarViewState extends State<CadastrarView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Produtos')
        )
    );
  }
}