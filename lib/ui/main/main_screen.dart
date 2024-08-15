import 'package:ebot/ui/main/ask_screen/ask_by_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ebot/ui/main/ask_screen/ask_by_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1E201E),
      appBar: AppBar(
        backgroundColor: const Color(0XFF1E201E),
        title: Text(
          'Hi, Ansel ' '👋',
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.person,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Padding(
              padding: EdgeInsets.only(top: 35.h, bottom: 10.h),
              child: Text(
                'What can I help?',
                style: GoogleFonts.firaCode(
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150.h),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ASK BY TEXT INPUT
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AskByText(),
                        ),
                      );
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
                          padding: EdgeInsets.only(
                              left: 20.w, top: 20.h, bottom: 10.h),
                          child: Text(
                            'Ask eBot by Text',
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
                  ),
                  // ASK BY TEXT & IMAGE INPUT
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AskByImage(),
                        ),
                      );
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
                          padding: EdgeInsets.only(
                              left: 20.w, top: 20.h, bottom: 10.h),
                          child: Text(
                            'Ask eBot by Image',
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'History',
              textAlign: TextAlign.center,
              style: GoogleFonts.firaCode(
                fontWeight: FontWeight.w600,
                textStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
