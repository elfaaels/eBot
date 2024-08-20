import 'package:ebot/shared/theme.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationScreen extends StatelessWidget {
  final ValueNotifier<bool>? isPresented;

  const InformationScreen({Key? key, this.isPresented}) : super(key: key);

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
      body: ListView(
        children: [
          _buildSectionHeader('ABOUT THE APP'),
          _buildListRow('Application', Icons.apps, 'eBot', Colors.blue),
          _buildListRow(
              'Compatibility', Icons.info, 'Android, iOS', Colors.red),
          _buildListRow('Technology', Icons.code, 'Flutter', Colors.orange),
          _buildListRow('Version', Icons.settings, '1.0.0', Colors.purple),
          _buildListRow(
              'Developer', Icons.developer_mode, 'Elfaael', Colors.teal),
          _buildListRow(
              'Designer', Icons.chevron_right, 'Elfaael', Colors.pink),
          _buildListRow(
              'Website', Icons.public, 'elfaael.webflow.io', Colors.indigo),
          // _buildListRowWithLink('Website', Icons.public, 'My Website',
          //     Colors.pink, 'https://elfaael.webflow.io'),
          _buildSectionFooter('Copyright All Rights Reserved'),
        ],
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
