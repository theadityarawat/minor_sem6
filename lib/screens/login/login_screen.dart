import 'package:flutter/material.dart';
import '../../components/custom_back_button.dart';
import '/screens/login/components/body.dart';
import '/size_config.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: SizedBox(
              width: 30,
              height: 30,
              child: CustomBackButton()),
        ),

      ),
      body: Body(),
    );
  }
}
