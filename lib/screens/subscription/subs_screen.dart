import 'package:flutter/material.dart';
import '/components/coustom_bottom_nav_bar.dart';
import '/enums.dart';
import 'package:minor_sem6/components/custom_back_button.dart';

import 'components/body.dart';

class SubsScreen extends StatelessWidget {
  static String routeName = "/subscription";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: SizedBox(width: 30, height: 30, child: CustomBackButton()),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
