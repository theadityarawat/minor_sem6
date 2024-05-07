import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minor_sem6/screens/meal_plan/meal_plan.dart';
import 'package:minor_sem6/screens/subscription/subs_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:minor_sem6/size_config.dart';
import 'package:minor_sem6/components/profile_picture.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../components/profile_menu.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text('Account', style: GoogleFonts.dmSans(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            ProfilePicture(size: 100,),
            SizedBox(height: 20),
            Text('Jethalal Gada', style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xFF072846)),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  ProfileMenu(
                    text: "Subscription",
                    // icon: "assets/icons/home.svg",
                    text2: "👑",
                    press: () => {Navigator.pushNamed(context, SubsScreen.routeName)},
                  ),
                  // ProfileMenu(
                  //   text: "Profile",
                  //   // icon: "assets/icons/home.svg",
                  //   press: () {},
                  //   text2: '👤',
                  // ),
                  ProfileMenu(
                    text: "Help",
                    // icon: "assets/icons/home.svg",
                    press: () {
                      launchUrlString("tel: +91 8816023345");
                    },
                    text2: '❓',
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ProfileMenu(
                  text: "Diet",
                  // icon: "assets/icons/home.svg",
                  press: () {
                    Navigator.pushNamed(context, MealPlanScreen.routeName);
                  },
                  text2: '🍏',
                ),
                // ProfileMenu(
                //   text: "General",
                //   // icon: "assets/icons/home.svg",
                //   press: () {},
                //   text2: '⚙',
                // ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
