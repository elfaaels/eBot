import 'package:ebot/model/question.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:ebot/shared/api_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AskByText extends StatefulWidget {
  const AskByText({super.key});

  @override
  State<AskByText> createState() => _AskByTextState();
}

class _AskByTextState extends State<AskByText> {
  final TextEditingController _questionTextController = TextEditingController();
  String _ebotAnswer = '';
  Question? question;

  getAnswerFromText() {
    GenerativeModel model = GenerativeModel(
        model: 'gemini-1.5-flash-latest', apiKey: ApiConfig().apiKey);
    model.generateContent([Content.text(_questionTextController.text)]).then(
        (value) {
      setState(() {
        _ebotAnswer = value.text.toString();
      });
    });
    // Save Data to Firestore add to Bloc Listener
    setState(() {
      question?.createdAt = DateTime.now().toString();
      question?.textQuestion = _questionTextController.text;
      question?.imageQuestion = false;
      question?.answer = _ebotAnswer;
      question?.imageUrl = '';
    });
    DatabaseService().addQuestion(question: question);
  }

  ebotAnswerContent() {
    return Padding(
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h, left: 40.w, right: 40.w),
      child: Text(
        _ebotAnswer,
        textAlign: TextAlign.justify,
        style: GoogleFonts.firaCode(
          fontWeight: FontWeight.normal,
          textStyle: TextStyle(
            color: Colors.green,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _questionTextController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFF1E201E),
      appBar: AppBar(
        backgroundColor: const Color(0XFF1E201E),
        title: Text(
          'Ask eBot by Text',
          textAlign: TextAlign.center,
          style: GoogleFonts.firaCode(
            fontWeight: FontWeight.w500,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: _ebotAnswer.isEmpty ? 100.h : 50.h),
              _ebotAnswer.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: 35.h, bottom: 10.h, left: 40.w, right: 40.w),
                      child: Text(
                        'Type anything you want to ask...',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.firaCode(
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    )
                  : ebotAnswerContent(),
              SizedBox(height: _ebotAnswer.isEmpty ? 150.h : 50.h),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
                child: TextFormField(
                  controller: _questionTextController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0.0,
                      ),
                    ),
                    labelText: 'Ask me Anything!',
                  ),
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60.h, bottom: 10.h),
                      child: ElevatedButton(
                        onPressed: () {
                          getAnswerFromText();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 5,
                          minimumSize: const Size(180, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Ask',
                          style: GoogleFonts.firaCode(
                            fontWeight: FontWeight.normal,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
