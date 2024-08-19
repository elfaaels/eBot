import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:ebot/model/question.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:ebot/shared/api_config.dart';
import 'package:equatable/equatable.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'ask_by_text_event.dart';
part 'ask_by_text_state.dart';

class AskByTextBloc extends Bloc<AskByTextEvent, AskByTextState> {
  AskByTextBloc() : super(AskByTextInitial()) {
    on<AskByTextEvent>((event, emit) {});
    on<AskButtonPressed>((event, emit) async {
      emit(AskByTextLoading());
      try {
        String? ebotAnswer;
        GenerativeModel model = GenerativeModel(
            model: 'gemini-1.5-flash-latest', apiKey: ApiConfig().apiKey);
        model.generateContent([Content.text(event.textQuestion)]).then((value) {
          // SET to New Variable
          ebotAnswer = value.text.toString();
        });
        emit(AskByTextSuccess(ebotAnswer: ebotAnswer));
      } catch (e) {
        emit(AskByTextError(error: e.toString()));
      }
    });
  }
}
