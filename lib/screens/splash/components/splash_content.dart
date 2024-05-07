import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      const SizedBox(height: 100,),
      // Image.asset('assets/images/logo.png', height: 50, width: 50,),
      // Text(
      //   "ZetaFit",
      //   style: TextStyle(
      //     fontSize: getProportionateScreenWidth(36),
      //     color: Colors.white,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   // textAlign: TextAlign.center,
      // ),
      // SizedBox(height: 8), // Adjust spacing as needed
      Text(
        text!.substring(0, 29),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(36),
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text!.substring(29),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Spacer(flex: 2),
      Image.asset(
        image!,
        height: getProportionateScreenHeight(215),
        width: getProportionateScreenWidth(215),
        fit: BoxFit.cover,
      ),
      // SvgPicture.asset(
      //   image!,
      //   fit: BoxFit.cover,
      // ),
      // const Spacer(),
    ],
          );
  }
}
