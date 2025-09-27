import 'package:flutter/material.dart';

class ProdutosView extends StatefulWidget{
  const ProdutosView({super.key});

  @override
  State<ProdutosView> createState() => _ProdutosViewState();
}

class _ProdutosViewState extends State<ProdutosView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Produtos')
        )
    );
  }
}