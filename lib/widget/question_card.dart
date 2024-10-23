import 'package:ebot/shared/theme.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCard extends StatelessWidget {
  final String? questionText;
  final String? date;

  const QuestionCard({
    super.key,
    this.questionText,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.w,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ThemeColor.mainBackgroundColor,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionText ?? 'N/A',
                style: GoogleFonts.firaCode(
                  fontWeight: FontWeight.w500,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Text(
                date ?? 'N/A',
                style: GoogleFonts.firaCode(
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
