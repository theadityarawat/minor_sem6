import 'package:flutter/material.dart';
import '/size_config.dart';
import 'package:google_fonts/google_fonts.dart';


// const kMainColor = Color(0xFFFF7643);
const kPrimaryColor = Color(0xFFF7B400);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF072846);
const kTextColor = Color(0xFF757575);

const kAnimateTime = Duration(milliseconds: 200);

final headingStyleText = GoogleFonts.poppins(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(28),
  // fontWeight: FontWeight.bold,
  fontWeight: FontWeight.w600,
);

const time = Duration(milliseconds: 250);
//error statements
final RegExp kValidEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kNoMail = "Please Enter your email";
const String kWrongEmailFormat = "Please Enter Valid Email";
const String kNoPass = "Please Enter your password";
const String kWeakPass = "Password is too short";
const String kPassMismatch = "Passwords don't match";
const String kNoName = "Please Enter your name";
const String kNoNumber = "Please Enter your phone number";
const String kNoAddress = "Please Enter your address";

final otpStyle = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

InputDecoration kInputDecoration({required String hintText, required Icon mySuffixIcon}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(),
    contentPadding: const EdgeInsets.all(18),
    suffixIcon: mySuffixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}