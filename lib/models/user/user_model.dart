import 'dart:convert';

class UserModel {
  int id;
  String userName;
  String booksFav;

  UserModel({
    required this.id,
    required this.userName,
    this.booksFav = '',
  });

  Map<String, dynamic> toMap(String books) {
    return {
      'id': id,
      'userName': userName,
      'booksFav': books,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      userName: map['userName'] ?? '',
      booksFav: map['booksFav'] ?? '',
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
