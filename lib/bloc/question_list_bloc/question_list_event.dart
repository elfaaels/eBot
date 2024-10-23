part of 'question_list_bloc.dart';

abstract class QuestionListEvent extends Equatable {
  const QuestionListEvent();
}

class QuestionListLoaded extends QuestionListEvent {
  const QuestionListLoaded();

  @override
  List<Object> get props => [];
}

class QuestionDelete extends QuestionListEvent {
  final String id;

  const QuestionDelete(this.id);

  @override
  List<Object> get props => [];
}
