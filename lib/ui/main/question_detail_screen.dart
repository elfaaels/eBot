import 'package:ebot/shared/theme.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionDetailScreen extends StatefulWidget {
  final String? questionText;
  final String? answer;
  final String? date;

  const QuestionDetailScreen(
      {super.key, this.questionText, this.answer, this.date});

  @override
  State<QuestionDetailScreen> createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mainBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.questionText ?? 'N/A',
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              widget.questionText ?? 'N/A',
              style: GoogleFonts.firaCode(
                fontWeight: FontWeight.w400,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Divider(height: 50.w),
            Text(
              widget.answer ?? 'N/A',
              style: GoogleFonts.firaCode(
                fontWeight: FontWeight.w400,
                textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Divider(height: 50.w),
            Text(
              widget.date ?? 'N/A',
              style: GoogleFonts.firaCode(
                fontWeight: FontWeight.w400,
                textStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
