import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EbotMainButton extends StatefulWidget {
  final String buttonTitle;
  final Function()? action;

  const EbotMainButton({super.key, required this.buttonTitle, this.action});

  @override
  State<EbotMainButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EbotMainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action;
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          height: 50.h,
          width: 320.w,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
            child: Text(
              widget.buttonTitle,
              textAlign: TextAlign.left,
              style: GoogleFonts.firaCode(
                fontWeight: FontWeight.normal,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
