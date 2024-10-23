import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ebot/model/question.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:ebot/shared/api_config.dart';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

part 'ask_by_image_event.dart';
part 'ask_by_image_state.dart';

class AskByImageBloc extends Bloc<AskByImageEvent, AskByImageState> {
  AskByImageBloc() : super(AskByImageInitial()) {
    // --- EVENTS ---
    on<GetAnswerFromImage>(_onGetAnswerFromImage);
  }

  // --- FUNCTIONS ---
  Future<void> _onGetAnswerFromImage(
      GetAnswerFromImage event, Emitter<AskByImageState> emit) async {
    emit(AskByImageLoading());
    try {
      GenerativeModel model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: ApiConfig().apiKey,
      );

      final response = await model.generateContent([
        Content.multi([
          TextPart(event.question),
          if (event.image != null)
            DataPart('image/jpeg', File(event.image!.path).readAsBytesSync())
        ])
      ]);

      final answer = response.text.toString();

      if (answer.isNotEmpty) {
        await _saveToFirestore(event.question, answer, event.image);
      }

      emit(AskByImageLoaded(answer));
    } catch (e) {
      emit(AskByImageError(e.toString()));
    }
  }

  Future<void> _saveToFirestore(
      String question, String answer, XFile? image) async {
    try {
      Question questionModel = Question()
        ..createdAt = DateTime.now().toString()
        ..textQuestion = question
        ..answer = answer
        ..imageQuestion = true
        ..imageUrl = image?.path;

      await DatabaseService().addQuestion(question: questionModel);
    } catch (e) {
      // Log the error, but don't throw it as the main functionality (getting the answer) has succeeded
      if (kDebugMode) {
        log('Error saving to Firestore: $e');
      }
    }
  }
}
