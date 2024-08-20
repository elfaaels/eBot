part of 'question_list_bloc.dart';

abstract class QuestionListState extends Equatable {
  const QuestionListState();
}

class QuestionListInitial extends QuestionListState {
  @override
  List<Object> get props => [];
}

class QuestionListSuccess extends QuestionListState {
  final List<Question> questions;

  const QuestionListSuccess(this.questions);
  @override
  List<Object> get props => [];
}

class QuestionListLoading extends QuestionListState {
  const QuestionListLoading();
  @override
  List<Object> get props => [];
}

class QuestionListEmpty extends QuestionListState {
  const QuestionListEmpty();
  @override
  List<Object> get props => [];
}

class QuestionListError extends QuestionListState {
  final String? error;

  const QuestionListError({this.error});
  @override
  List<Object> get props => [];
}
