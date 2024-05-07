import 'package:flutter/material.dart';
import 'package:minor_sem6/components/coustom_bottom_nav_bar.dart';
import 'package:minor_sem6/enums.dart';
import '../../components/custom_back_button.dart';
import '/screens/home/components/body.dart';
import '/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 90,
      //   leading: Padding(
      //     padding: EdgeInsets.only(
      //       left: 30,
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         GestureDetector(
      //           onTap:() {Navigator.pop(context);},
      //           child: ProfilePicture(),
      //         ),
      //         // Expanded(child: Container()),
      //         Text(date.toLocal().toString()),
      //       ],
      //     ),
      //   ),
      // ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}