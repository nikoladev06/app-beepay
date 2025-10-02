import 'user_model.dart';

class Evento {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String imageUrl;
  final UserModel user;

  Evento({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.user,
  });
}