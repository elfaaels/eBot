import 'dart:developer';
import 'package:ebot/bloc/question_list_bloc/question_list_bloc.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:ebot/shared/theme.dart.dart';
import 'package:ebot/ui/main/question_detail_screen.dart';
import 'package:ebot/widget/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionListScreen extends StatefulWidget {
  final String? questionText;
  final String? date;

  const QuestionListScreen({
    super.key,
    this.questionText,
    this.date,
  });

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  final DatabaseService _databaseService = DatabaseService();
  // QuestionListBloc? _questionListBloc;

  // List<Question> _questionData = [
  //   Question(
  //     textQuestion: 'Who is fred again?',
  //     answer: 'TEST TEST TEST',
  //     createdAt: '2022-01-01 12:00:00',
  //   ),
  //   Question(
  //     textQuestion: 'Who is Taylor Swift?',
  //     createdAt: '2022-01-01 12:00:00',
  //   ),
  // ];

  Widget _emptyState() {
    return Center(
      child: Text(
        'Empty',
        textAlign: TextAlign.center,
        style: GoogleFonts.firaCode(
          fontWeight: FontWeight.w500,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    log("INIT: QuestionListScreen");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'History',
          textAlign: TextAlign.center,
          style: GoogleFonts.firaCode(
            fontWeight: FontWeight.w500,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ThemeColor.mainBackgroundColor,
      ),
      body: BlocProvider<QuestionListBloc>(
        create: (context) => QuestionListBloc(
          databaseService: _databaseService,
        )..add(QuestionListLoaded()),
        child: BlocListener<QuestionListBloc, QuestionListState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<QuestionListBloc, QuestionListState>(
            builder: (context, state) {
              log("BLOC STATE: " + state.toString());
              if (state is QuestionListSuccess) {
                final questions = state.questions;
                log(questions.toString());
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final item = questions[index];
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          height: 85.w,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: ThemeColor.mainBackgroundColor,
                            border: Border.all(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.delete, color: Colors.red),
                                Text(
                                  " Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            BlocProvider.of<QuestionListBloc>(context).add(
                              QuestionDelete(
                                questions[index].id.toString(),
                              ),
                            );
                            questions.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("$item dismissed")),
                          );
                        },
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuestionDetailScreen(
                                    date: questions[index].createdAt,
                                    questionText: questions[index].textQuestion,
                                    answer: questions[index].answer,
                                    imageQuestion:
                                        questions[index].imageQuestion,
                                    imageUrl: questions[index].imageUrl,
                                  ),
                                ));
                          },
                          child: QuestionCard(
                            questionText: item.textQuestion,
                            date: item.createdAt,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is QuestionListLoading) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: _emptyState(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
