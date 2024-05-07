import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SubsMenu extends StatelessWidget {
  const SubsMenu({
    Key? key,
    required this.heroText,
    required this.amount,
    required this.planDuration,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String heroText, amount, planDuration, text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            // primary: kPrimaryColor,
            foregroundColor: Colors.black,
            padding: EdgeInsets.fromLTRB(20, 20, 8, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Color(0xFFF5F6F9),
          ),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    heroText,
                    style: GoogleFonts.dmSans(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 12.0,
                      ),
                      Text(
                        amount,
                        style: GoogleFonts.dmSans(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          planDuration,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Text(text, style: GoogleFonts.dmSans(fontSize: 11,),),
                ],
              ),
              Image.asset(icon, height: 160,),
            ],
          ),
        ),
      ),
    );
  }
}
