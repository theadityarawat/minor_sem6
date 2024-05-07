import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components/socal_card.dart';
import '/constants.dart';
import 'meal_menu.dart';
import 'package:minor_sem6/components/complete_meal.dart';
import '/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: MealList(),
      ),
    );
  }
}