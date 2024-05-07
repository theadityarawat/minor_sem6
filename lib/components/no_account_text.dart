import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: GoogleFonts.poppins(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
