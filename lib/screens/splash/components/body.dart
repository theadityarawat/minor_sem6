import 'package:flutter/material.dart';
import 'package:minor_sem6/screens/home/home_screen.dart';
import 'package:minor_sem6/screens/login/login_screen.dart';
import 'package:minor_sem6/screens/login_success/login_success_screen.dart';
import '../../../components/start_button.dart';
import '/constants.dart';
// import '/screens/sign_in/sign_in_screen.dart';
import '/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "You Should Know What You Eat Gain insights in your nutritional habits with detailed statistics",
      "image": "assets/images/splash_1.png",
    },
    {
      "text":
          "Track Your Diet              We will help you lose weight, stay fit, or build muscle",
      "image": "assets/images/splash_2.png",
    },
    {
      "text":
          "Live Healthy & Great         Let’s start this journey and live healthy together!",
      "image": "assets/images/splash_3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      const Spacer(flex: 2),
                      StartButton(
                        text: "Let's get Fit!",
                        press: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimateTime,
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 40 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
