part of 'ask_by_text_bloc.dart';

abstract class AskByTextEvent extends Equatable {
  const AskByTextEvent();
}

class AskButtonPressed extends AskByTextEvent {
  final String textQuestion;
  final bool? imageQuestion;
  final String? ebotAnswer;
  final String? imageUrl;

  const AskButtonPressed(
      {required this.textQuestion,
      this.imageQuestion,
      this.ebotAnswer,
      this.imageUrl});

  @override
  List<Object> get props => [
        this.textQuestion,
        this.imageQuestion ?? 'N/A',
        this.ebotAnswer ?? 'N/A',
        this.imageUrl ?? 'N/A'
      ];
}
