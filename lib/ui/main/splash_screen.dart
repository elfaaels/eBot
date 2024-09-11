import 'package:ebot/bloc/splash_bloc/splash_bloc.dart';
import 'package:ebot/ui/main/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:developer';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashInitial) {
          // locator.get<NavigationUtils>().pushReplacementNamed(Routes.MAIN);
          _navigateToNextScreen();
        } else if (state is SplashUnAuthenticated) {
          // To check Auth State
          log('Splash Unauthenticated');
        } else if (state is SplashError) {
          log('ERROR Routing Splash');
        }
      },
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0XFF1E201E),
            body: SafeArea(
              top: false,
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.w,
                        width: 250.w,
                        child: Lottie.asset('assets/lottie_bot.json'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.w, 0, 20.w),
                        child: Text(
                          'eBot',
                          style: GoogleFonts.pixelifySans(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 36.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
