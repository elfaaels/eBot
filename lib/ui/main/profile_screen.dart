import 'package:ebot/bloc/profile_bloc/profile_bloc.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:ebot/shared/theme.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final DatabaseService _databaseService = DatabaseService();
  String? profileEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeColor.mainBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(
          databaseService: _databaseService,
        )..add(ProfileLoaded()),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSucceed) {
                profileEmail = state.user!.email;
                return ListView(
                  children: [
                    _buildSectionHeader('PROFILE INFORMATION'),
                    _buildListRow(
                        'Email', Icons.person, profileEmail, Colors.blue),
                    _buildSectionFooter(
                        '© 2024 eBot. Copyright All Rights Reserved.'),
                  ],
                );
              } else if (state is ProfileLoading) {
                return CircularProgressIndicator();
              } else {
                return Container(
                  child: Center(
                    child: Text(
                      'ERROR',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.firaCode(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: GoogleFonts.firaCode(
          fontWeight: FontWeight.w500,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionFooter(String footer) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Center(
        child: Text(
          footer,
          style: GoogleFonts.firaCode(
            fontWeight: FontWeight.w400,
            textStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListRow(
      String label, IconData icon, String? content, Color tintColor) {
    return ListTile(
      leading: Icon(icon, color: tintColor),
      title: Text(
        label,
        style: GoogleFonts.firaCode(
          fontWeight: FontWeight.w500,
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ),
      ),
      subtitle: content != null ? Text(content) : null,
    );
  }

  Widget _buildListRowWithLink(String label, IconData icon, String linkLabel,
      Color tintColor, String linkDestination) {
    return ListTile(
      leading: Icon(icon, color: tintColor),
      title: Text(label),
      subtitle: GestureDetector(
        onTap: () {
          // Handle link tap
        },
        child: Text(
          linkLabel,
          style: GoogleFonts.firaCode(
            fontWeight: FontWeight.w500,
            textStyle: TextStyle(
              color: Colors.blue,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
