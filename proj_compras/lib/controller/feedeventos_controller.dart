import 'package:flutter/material.dart';

import '../model/postevento_model.dart';
import '../model/user_model.dart';

class FeedEventos extends ChangeNotifier {
  final List<Evento> _eventos = [
    Evento(
      id: 1,
      title: "Integra Fatec RP",
      description: "Halloween da Fatec RP: open bar e muita música",
      date: DateTime(2025, 10, 28),
      location: "",
      imageUrl: "https://",
      user: UserModel(id: 1, email: "admin@admin.com", name: "Admin", password: "123"),
    ),
    Evento(
      id: 2,
      title: "Semana Acadêmica Fatec RP",
      description: "Palestras, workshops e networking com profissionais da área de tecnologia.",
      date: DateTime(2025, 11, 10),
      location: "Auditório Principal - Fatec RP",
      imageUrl: "https://",
      user: UserModel(id: 1, email: "admin@admin.com", name: "Admin", password: "123"),
    ),
    Evento(
      id: 3,
      title: "InterFatecs 2025",
      description: "Competições esportivas e culturais entre as Fatecs do estado de São Paulo.",
      date: DateTime(2025, 12, 5),
      location: "Ginásio Municipal de Ribeirão Preto",
      imageUrl: "https://",
      user: UserModel(id: 1, email: "admin@admin.com", name: "Admin", password: "123"),
    )
  ];

  List<Evento> get eventos => _eventos;
  bool _visualizarEventos = true;
  bool get visualizarEventos => _visualizarEventos;
}