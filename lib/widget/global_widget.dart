import 'package:flutter/material.dart';
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
}
