// import 'dart:developer';
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
    // --- FUNCTIONS ---
    Future<void> saveToFirestore(String question, String answer) async {
      Question questionModel = Question(
        createdAt: DateTime.now().toString(),
        textQuestion: question,
        answer: answer,
        imageQuestion: false,
        imageUrl: '',
      );
      await DatabaseService().addQuestion(question: questionModel);
    }

    Future<void> onGetAnswerFromText(
        GetAnswerFromText event, Emitter<AskByTextState> emit) async {
      emit(const AskByTextLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        GenerativeModel model = GenerativeModel(
            model: 'gemini-1.5-flash-latest', apiKey: ApiConfig().apiKey);
        final content =
            await model.generateContent([Content.text(event.question)]);
        final answer = content.text.toString();

        if (answer.isNotEmpty) {
          await saveToFirestore(event.question, answer);
        }

        emit(AskByTextSuccess(ebotAnswer: answer));
      } catch (e) {
        emit(AskByTextError(error: e.toString()));
      }
    }

    // --- EVENTS ---
    on<GetAnswerFromText>(onGetAnswerFromText);
  }
}
