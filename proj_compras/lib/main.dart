import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:proj_compras/view/inicio_view.dart';
import 'package:proj_compras/view/cadastrar_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
      )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      initialRoute: 'inicio',
      routes: {
        'inicio': (context) => InicioView(),
        'cadastrar': (context) => CadastrarView(),
      }
    );
  }
}