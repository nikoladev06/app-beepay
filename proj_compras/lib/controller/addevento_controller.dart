// controller/addevento_controller.dart
import 'package:flutter/material.dart';
import '../model/postevento_model.dart';
import '../model/user_model.dart';

class AddEventoController extends ChangeNotifier {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController localController = TextEditingController();
  
  DateTime _dataEvento = DateTime.now();
  TimeOfDay _horaEvento = TimeOfDay.now();

  DateTime get dataEvento => _dataEvento;
  TimeOfDay get horaEvento => _horaEvento;

  void setDataEvento(DateTime data) {
    _dataEvento = data;
    notifyListeners();
  }

  void setHoraEvento(TimeOfDay hora) {
    _horaEvento = hora;
    notifyListeners();
  }

  DateTime get dataHoraCompleta => DateTime(
    _dataEvento.year,
    _dataEvento.month,
    _dataEvento.day,
    _horaEvento.hour,
    _horaEvento.minute,
  );

  Evento criarEvento(UserModel usuarioAtual) {
    return Evento(
      id: DateTime.now().millisecondsSinceEpoch, //posteriormente gerado automaticamente via BD
      title: tituloController.text,
      description: descricaoController.text,
      date: dataHoraCompleta,
      location: localController.text,
      imageUrl: "https://",
      user: usuarioAtual,
    );
  }

  bool validarFormulario() {
    return tituloController.text.isNotEmpty && 
           descricaoController.text.isNotEmpty;
  }

  void limparFormulario() {
    tituloController.clear();
    descricaoController.clear();
    localController.clear();
    _dataEvento = DateTime.now().add(const Duration(days: 1));
    _horaEvento = TimeOfDay.now();
    notifyListeners();
  }

  @override
  void dispose() {
    tituloController.dispose();
    descricaoController.dispose();
    localController.dispose();
    super.dispose();
  }
}