// import 'dart:js';

// import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:minor_sem6/screens/home/home_screen.dart';
import 'package:minor_sem6/screens/login/login_screen.dart';
import 'package:minor_sem6/screens/profile/profile_screen.dart';
import 'package:minor_sem6/screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/meal_plan/meal_plan.dart';
import 'screens/subscription/subs_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/login_success/login_success_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MealPlanScreen.routeName: (context) => MealPlanScreen(),
  SubsScreen.routeName: (context) => SubsScreen(),
  // LoginSuccessScreen.routeName: (context)=> LoginSuccessScreen(),
};