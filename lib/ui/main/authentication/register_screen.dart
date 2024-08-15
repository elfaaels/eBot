import 'package:ebot/shared/theme.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mainBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ThemeColor.mainBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          // alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: Text(
                  'Register',
                  style: GoogleFonts.firaCode(
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                    ),
                  ),
                ),
              ),
              // USERNAME FIELD
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.w),
                child: Text(
                  'Username',
                  style: GoogleFonts.firaCode(
                    fontWeight: FontWeight.normal,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                child: TextFormField(
                  controller: _usernameTextController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                    ),
                    hintText: 'MyName123',
                    hintStyle: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
              ),
              // EMAIL FIELD
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.w),
                child: Text(
                  'Email',
                  style: GoogleFonts.firaCode(
                    fontWeight: FontWeight.normal,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                child: TextFormField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                    ),
                    // labelText: 'hello@mail.com',
                    hintText: 'hello@mail.com',
                    hintStyle: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
              ),
              // PASSWORD FIELD
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.w),
                child: Text(
                  'Password',
                  style: GoogleFonts.firaCode(
                    fontWeight: FontWeight.normal,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                child: TextFormField(
                  controller: _passwordTextController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 0.0,
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
              ),
              // REGISTER BUTTON
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const AskByText(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.w),
                  child: Center(
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
                      height: 45.w,
                      width: 300.w,
                      child: Center(
                        child: Text(
                          'Register',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.firaCode(
                              fontWeight: FontWeight.w700,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // DIVIDER
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 20.w),
                  child: Text(
                    "Login",
                    style: GoogleFonts.firaCode(
                      fontWeight: FontWeight.normal,
                      textStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 12.sp,
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
