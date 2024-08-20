import 'dart:developer';

import 'package:ebot/services/auth_service.dart';
import 'package:ebot/ui/main/init/onboarding_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ebot/shared/theme.dart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalWidget {
  void loadingAnimationPopUp(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: null,
            child: new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                // width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Center(
                        child: Text(
                          "Please Wait",
                          style: GoogleFonts.firaCode(
                            fontWeight: FontWeight.normal,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void errorDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: null,
            child: new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                // width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                      child: Center(
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 28.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Center(
                        child: Text(
                          "Error has occurred",
                          style: GoogleFonts.firaCode(
                            fontWeight: FontWeight.normal,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  showGlobalAlert(BuildContext context, String message,
      {bool isLogout = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Center(
          child: Container(
            width: 240.w,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4.w))),
            child: Material(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 18.sp,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      message,
                      style: GoogleFonts.firaCode(
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 24.w, 0.w, 0.w),
                        child: SizedBox(
                          height: 46.w,
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.w)),
                                backgroundColor: ThemeColor.mainBackgroundColor,
                              ),
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    fontFamily: "bold",
                                    fontSize: 13.sp,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                if (isLogout) {
                                  final result = AuthService().signOut();
                                  if (result != null) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OnboardingScreen()),
                                        (Route<dynamic> route) => false);
                                    if (kDebugMode) {
                                      log('SUCCESS: Logout');
                                    }
                                  } else {
                                    if (kDebugMode) {
                                      log('ERROR: Logout');
                                    }
                                  }
                                } else {
                                  Navigator.pop(context);
                                }
                              }),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
