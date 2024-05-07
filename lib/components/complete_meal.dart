
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components/socal_card.dart';
import '/constants.dart';
import 'package:minor_sem6/screens/meal_plan/components/meal_menu.dart';
import '/size_config.dart';


class MealList extends StatelessWidget {
  const MealList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        // SizedBox(height: 120),
        Text('Breakfast', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: kPrimaryColor),),
        SizedBox(height: 20,),
        MealMenu(
          text: 'Poha',
          mealPic: 'assets/meals/poha.png',
          press: (){},
        ),
        MealMenu(
          text: 'Oats',
          mealPic: 'assets/meals/oats.png',
          press: (){},
        ),Text('Snacks', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: kPrimaryColor),),
        MealMenu(
          text: 'Mixed Nuts',
          mealPic: 'assets/meals/mixed_nuts.png',
          press: (){},
        ),
        Text('Lunch', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: kPrimaryColor),),
        MealMenu(
          text: '1-2 Chapatis',
          mealPic: 'assets/meals/chapatis.png',
          press: (){},
        ),
        MealMenu(
          text: '1 Bowl of Dal',
          mealPic: 'assets/meals/dal.png',
          press: (){},
        ),
        MealMenu(
          text: '1 Bowl of Sabzi',
          mealPic: 'assets/meals/sabzi.png',
          press: (){},
        ),
        MealMenu(
          text: '1 Bowl of curd',
          mealPic: 'assets/meals/curd.png',
          press: (){},
        ),
        Text('Evening Snacks', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: kPrimaryColor),),
        MealMenu(
          text: '1 Bowl of fruits',
          mealPic: 'assets/meals/fruits.png',
          press: (){},
        ),
        MealMenu(
          text: '1 glass of fruit juice',
          mealPic: 'assets/meals/juice.png',
          press: (){},
        ),
        Text('Dinner', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: kPrimaryColor),),
        MealMenu(
          text: '1-2 Chapatis',
          mealPic: 'assets/meals/chapatis.png',
          press: (){},
        ),
        MealMenu(
          text: '1 Bowl of Dal',
          mealPic: 'assets/meals/dal.png',
          press: (){},
        ),
        MealMenu(
          text: '1 Bowl of Sabzi',
          mealPic: 'assets/meals/sabzi.png',
          press: (){},
        ),
        Text('Optional Beverages', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: kPrimaryColor),),
        MealMenu(
          text: 'Orange juice',
          mealPic: 'assets/meals/juice.png',
          press: (){},
        ),
        MealMenu(
          text: 'Lemonade',
          mealPic: 'assets/meals/lemonade.png',
          press: (){},
        ),
      ],
    );
  }
}
