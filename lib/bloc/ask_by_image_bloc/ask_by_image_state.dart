part of 'ask_by_image_bloc.dart';

abstract class AskByImageState {}

final class AskByImageInitial extends AskByImageState {}

class AskByImageLoading extends AskByImageState {}

class AskByImageLoaded extends AskByImageState {
  final String answer;

  AskByImageLoaded(this.answer);
}

class AskByImageError extends AskByImageState {
  final String error;

  AskByImageError(this.error);
}
