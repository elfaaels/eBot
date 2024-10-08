import 'package:ebot/utils/route_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ebot/ui/main/authentication/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1E201E),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                height: 34.h,
                width: 168.w,
                child: Center(
                  child: Text(
                    'Personal AI Buddy',
                    textAlign: TextAlign.center,
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
              SizedBox(
                height: 350.h,
                width: 300.w,
                child: Lottie.asset('assets/lottie_bot.json'),
              ),
              FadeInDown(
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20.w, 0, 20.w),
                  child: Text(
                    'eBot',
                    style: GoogleFonts.pixelifySans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 36.sp),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                child: ElevatedButton(
                  onPressed: () {
                    ScreenNavigator(cx: context).navigate(
                        const LoginScreen(), NavigatorTweens.rightToLeft());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 5,
                    minimumSize: const Size(240, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Get Started',
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
      ),
    );
  }
}
