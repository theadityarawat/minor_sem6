import 'package:flutter/material.dart';
import 'package:minor_sem6/components/custom_back_button.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: SizedBox(
              width: 30,
              height: 30,
              child: CustomBackButton()),
        ),
        // title: const Text('My App'),
      ),
      body: Body(),
    );
  }
}
