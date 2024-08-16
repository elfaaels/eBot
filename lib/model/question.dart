import 'package:ebot/model/user.dart';

class Question {
  String? id;
  String? createdAt;
  String? textQuestion;
  String? answer;
  bool? imageQuestion;
  String? imageUrl;
  User? user;

  Question({
    this.id,
    this.createdAt,
    this.textQuestion,
    this.answer,
    this.imageQuestion,
    this.imageUrl,
    this.user,
  });
}
