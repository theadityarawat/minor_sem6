import 'dart:math';

import 'package:minor_sem6/components/complete_meal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minor_sem6/constants.dart';
import 'package:minor_sem6/screens/profile/profile_screen.dart';
import '/components/no_account_text.dart';
import '/components/socal_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minor_sem6/components/custom_back_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:minor_sem6/components/profile_picture.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../size_config.dart';

DateTime date = DateTime.now().toLocal();
final player = AudioPlayer();

// DateTime date = DateTime(now.day, now.month, now.year);

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}
List<String> items = ['Poha', 'Oats'];
var progressValue = 06;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        child: ProfilePicture(size: 50,),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '0'+date.day.toString() +
                            '-0' +
                            date.month.toString() +
                            '-' +
                            date.year.toString(),
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF072846),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await player
                                .play(AssetSource('music/zing.mp3'));
                          },
                          icon: const Icon(
                            Icons.fitbit_rounded,
                            color: Color(0xFFe6eaed),
                          ),
                        ),
                      ),
                    ],
                  ), //Header
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    getStringBasedOnTime(),
                    style: headingStyleText,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "You've followed the streak for 06 days out of\n 07 days!!",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Container(
                    height: getProportionateScreenHeight(250),
                    width: getProportionateScreenWidth(320),
                    decoration: BoxDecoration(
                        color: Color(0xFF072846),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Expanded(
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.2,
                                    cornerStyle: CornerStyle.bothCurve,
                                    color: Color.fromARGB(30, 0, 169, 181),
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      // value: progressValue.toDouble(),
                                      value: 85.71,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 0.2,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      color: Color(0xFFF7B400),
                                    )
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        positionFactor: 0.1,
                                        angle: 90,
                                        widget: Text(
                                          '🔥\n' +
                                              '06',
                                              // progressValue.toStringAsFixed(0),
                                          style: GoogleFonts.dmSans(
                                              fontSize: 40,
                                              color: Color(0xFFF7B400)),
                                        ))
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Today\'s meal',
                          style: GoogleFonts.dmSans(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Expanded(child: Container()),
                        // Container(
                        //   width: 70,
                        //   height: 35,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20.0),
                        //       color: Color(0xFFF7B400)),
                        //   child: Image.asset(
                        //     'assets/images/threeDots.png',
                        //     width: 20,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // MealList(mealIds: ['Poha', 'Oats'],),
                  MealList(),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}



String getStringBasedOnTime() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning! 🌅';
  }
  if (hour < 17) {
    return 'Good Afternoon! ☀️';
  }
  return 'Good Evening! 🌃';
  return '' ?? 'Invalid hour';
}
