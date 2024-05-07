import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.text2,
    // required this.icon,
    this.press,
  }) : super(key: key);

  final String text, text2;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        width: 180,
        height: 180, // Set width for each menu item
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Color(0xFFF5F6F9),
          ),
          onPressed: press,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   icon,
              //   color: kPrimaryColor,
              //   width: 32,
              // ),
              Text(
                text2,
                style: GoogleFonts.poppins(textStyle: headingStyleText),
              ),
              const SizedBox(height: 30),
              Text(
                text,
                style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
