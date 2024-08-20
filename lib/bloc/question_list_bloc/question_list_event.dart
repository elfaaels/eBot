part of 'question_list_bloc.dart';

abstract class QuestionListEvent extends Equatable {
  const QuestionListEvent();
}

class QuestionListLoaded extends QuestionListEvent {
  const QuestionListLoaded();

  @override
  List<Object> get props => [];
}
