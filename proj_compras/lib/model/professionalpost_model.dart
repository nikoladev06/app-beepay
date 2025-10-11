import 'user_model.dart';
import 'comentario_model.dart';

class ProfessionalPost {
  final int id;
  final String description;
  final DateTime date;
  final String? imageUrl;
  final UserModel user;
  final DateTime createdAt;
  bool isLiked;
  int likesCount;
  List<Comentario> comentarios;

  ProfessionalPost({
    required this.id,
    required this.description,
    required this.date,
    this.imageUrl,
    required this.user,
    DateTime? createdAt,
    this.isLiked = false,
    this.likesCount = 0,
    this.comentarios = const [],
  }) : createdAt = createdAt ?? DateTime.now();
}