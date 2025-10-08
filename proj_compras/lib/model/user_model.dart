class UserModel {
  final int id;
  final String email;
  final String name;
  // final String university;
  // final String course;
  final String password;
  final String? profileImage;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    // required this.university,
    // required this.course,
    required this.password,
    this.profileImage,
  });
}