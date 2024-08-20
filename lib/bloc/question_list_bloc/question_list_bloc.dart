import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ebot/model/question.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:equatable/equatable.dart';

part 'question_list_event.dart';
part 'question_list_state.dart';

class QuestionListBloc extends Bloc<QuestionListEvent, QuestionListState> {
  final DatabaseService databaseService;

  QuestionListBloc({required this.databaseService})
      : super(QuestionListInitial()) {
    on<QuestionListEvent>((event, emit) {});
    on<QuestionListLoaded>((event, emit) async {
      try {
        emit(QuestionListLoading());
        log("question loading");
        final result = await databaseService.getQuestionsForCurrentUser();
        if (result.isNotEmpty) {
          log("question success");
          emit(QuestionListSuccess(result));
        }
      } catch (e) {
        log(e.toString());
        emit(QuestionListError(error: e.toString()));
      }
    });
  }
}
