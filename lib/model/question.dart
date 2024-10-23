import 'package:ebot/model/user.dart';

class Question {
  String? id;
  String? createdAt;
  String? textQuestion;
  String? answer;
  bool? imageQuestion;
  String? imageUrl;
  UserModel? user;

  Question({
    this.id,
    this.createdAt,
    this.textQuestion,
    this.answer,
    this.imageQuestion,
    this.imageUrl,
    this.user,
  });

  factory Question.fromMap(Map<String, dynamic> map, String documentId) {
    return Question(
      id: documentId,
      createdAt: map['createdAt'],
      textQuestion: map['textQuestion'] ?? '',
      answer: map['answer'] ?? '',
      imageQuestion: map['imageQuestion'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
