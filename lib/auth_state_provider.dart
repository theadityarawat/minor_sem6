import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minor_sem6/screens/home/home_screen.dart'; // Make sure to import your home screen
import 'package:minor_sem6/screens/login/login_screen.dart';
import 'package:minor_sem6/screens/splash/splash_screen.dart'; // Make sure to import your sign-in screen

class AuthStateProvider extends StatelessWidget {
  const AuthStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return HomeScreen(); // User is signed in
        }
        return SplashScreen(); // User is not signed in
      },
    );
  }
}
