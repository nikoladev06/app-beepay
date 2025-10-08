// controller/addevento_controller.dart
import 'package:flutter/material.dart';
import '../model/professionalpost_model.dart';
import '../model/user_model.dart';

class AddProfessionalPostController extends ChangeNotifier {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController localController = TextEditingController();


  ProfessionalPost createProfessionalPost(UserModel usuarioAtual) {
    return ProfessionalPost(
      id: DateTime.now().millisecondsSinceEpoch, //posteriormente gerado automaticamente via BD
      description: descriptionController.text,
      date: DateTime.now(),
      imageUrl: "https://",
      user: usuarioAtual,
    );
  }

  bool validarFormulario() {
    return descriptionController.text.isNotEmpty;
  }

  void limparFormulario() {
    descriptionController.clear();
    localController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    localController.dispose();
    super.dispose();
  }
}