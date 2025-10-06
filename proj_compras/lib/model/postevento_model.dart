import 'user_model.dart';

class Evento {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String imageUrl;
  final UserModel user;
  final DateTime createdAt;
  bool isLiked;
  int likesCount;
  List<Comentario> comentarios;

  Evento({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.user,
    DateTime? createdAt,
    this.isLiked = false,
    this.likesCount = 0,
    this.comentarios = const [],
  }) : createdAt = createdAt ?? DateTime.now();
}


class Comentario {
  final int id;
  final UserModel user;
  final String text;
  final DateTime createdAt;

  Comentario({
    required this.id,
    required this.user,
    required this.text,
    required this.createdAt,
  });
}