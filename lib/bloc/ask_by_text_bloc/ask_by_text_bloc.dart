import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ask_by_text_event.dart';
part 'ask_by_text_state.dart';

class AskByTextBloc extends Bloc<AskByTextEvent, AskByTextState> {
  AskByTextBloc() : super(AskByTextInitial()) {
    on<AskByTextEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
