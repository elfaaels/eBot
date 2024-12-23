import 'dart:io';
import 'package:ebot/bloc/ask_by_image_bloc/ask_by_image_bloc.dart';
import 'package:ebot/widget/loading_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskByImage extends StatefulWidget {
  const AskByImage({super.key});

  @override
  State<AskByImage> createState() => _AskByImageState();
}

class _AskByImageState extends State<AskByImage> {
  final TextEditingController _questionTextController = TextEditingController();
  String _ebotAnswer = '';
  XFile? _image;
  bool isLoading = false;

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
    _image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreenWidget()
        : Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0XFF1E201E),
            appBar: AppBar(
              backgroundColor: const Color(0XFF1E201E),
              title: Text(
                'Ask eBot by Image',
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
            body: BlocProvider(
              create: (context) => AskByImageBloc(),
              child: BlocConsumer<AskByImageBloc, AskByImageState>(
                listener: (context, state) {
                  if (state is AskByImageError) {
                    // Show error message
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  } else if (state is AskByImageLoaded) {
                    setState(() {
                      _ebotAnswer = state.answer;
                    });
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<AskByImageBloc, AskByImageState>(
                    builder: (context, state) {
                      return state is AskByImageLoading
                          ? const LoadingScreenWidget()
                          : Container(
                              alignment: Alignment.center,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height:
                                            _ebotAnswer.isEmpty ? 100.h : 40.h),
                                    // IMAGE PICKED CONTENT
                                    Container(
                                      width: _image != null ? 200.w : 0,
                                      height: _image != null ? 250.w : 0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: _image != null
                                            ? DecorationImage(
                                                image: FileImage(File(
                                                  _image!.path,
                                                )),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                        height: _ebotAnswer.isEmpty ? 0 : 40.w),
                                    _ebotAnswer.isEmpty
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                top: 35.h,
                                                bottom: 10.h,
                                                left: 40.w,
                                                right: 40.w),
                                            child: Text(
                                              'Pick any Image...',
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
                                    SizedBox(
                                        height: _ebotAnswer.isEmpty &&
                                                _image == null
                                            ? 150.h
                                            : 50.h),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 14.w, right: 14.w),
                                      child: TextFormField(
                                        controller: _questionTextController,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 0.0,
                                            ),
                                          ),
                                          labelText: 'Ask me Anything!',
                                        ),
                                        onSaved: (String? value) {},
                                        validator: (String? value) {
                                          return (value != null &&
                                                  value.contains('@'))
                                              ? 'Do not use the @ char.'
                                              : null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: _ebotAnswer.isEmpty &&
                                                        _image == null
                                                    ? 60.h
                                                    : 30.h,
                                                bottom: 6.h),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                ImagePicker()
                                                    .pickImage(
                                                        source:
                                                            ImageSource.gallery)
                                                    .then(
                                                  (value) {
                                                    setState(() {
                                                      _image = value;
                                                    });
                                                  },
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.black,
                                                elevation: 5,
                                                minimumSize:
                                                    const Size(180, 55),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: Text(
                                                'Pick Image',
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
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.h, bottom: 16.h),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<AskByImageBloc>()
                                                    .add(
                                                      GetAnswerFromImage(
                                                          question:
                                                              _questionTextController
                                                                  .text,
                                                          image: _image),
                                                    );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.black,
                                                elevation: 5,
                                                minimumSize:
                                                    const Size(180, 55),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
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
                            );
                    },
                  );
                },
              ),
            ),
          );
  }
}
