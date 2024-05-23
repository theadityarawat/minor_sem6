import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class MealMenu extends StatelessWidget {
  const MealMenu({
    Key? key,
    required this.text,
    required this.mealPic,
    this.press,
  }) : super(key: key);

  final String text, mealPic;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 150,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kSecondaryColor, textStyle: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold),
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Color(0xFFF5F6F9),
          ),
          onPressed: press,
          child: Row(
            children: [
              Image.asset(mealPic, width: 90,),
              SizedBox(width: 20),
              Expanded(child: Text(text)),
              // Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
