import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_back_button.dart';
import '/components/coustom_bottom_nav_bar.dart';
import '/enums.dart';

import 'components/body.dart';

class MealPlanScreen extends StatelessWidget {
  static String routeName = "/meal_plan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan', style: GoogleFonts.dmSans(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
        leadingWidth: 80,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: SizedBox(width: 30, height: 30, child: CustomBackButton()),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.mealPlan),
    );
  }
}
