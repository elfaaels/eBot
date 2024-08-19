part of 'ask_by_text_bloc.dart';

abstract class AskByTextState extends Equatable {
  const AskByTextState();
}

class AskByTextInitial extends AskByTextState {
  @override
  List<Object> get props => [];
}

class AskByTextSuccess extends AskByTextState {
  final String? ebotAnswer;

  const AskByTextSuccess({this.ebotAnswer});
  @override
  List<Object> get props => [];
}

class AskByTextLoading extends AskByTextState {
  const AskByTextLoading();
  @override
  List<Object> get props => [];
}

class AskByTextError extends AskByTextState {
  final String? error;

  const AskByTextError({this.error});
  @override
  List<Object> get props => [];
}
