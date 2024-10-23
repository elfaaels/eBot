part of 'ask_by_image_bloc.dart';

sealed class AskByImageEvent {}

class GetAnswerFromImage extends AskByImageEvent {
  final String question;
  final XFile? image;

  GetAnswerFromImage({required this.question, this.image});
}
