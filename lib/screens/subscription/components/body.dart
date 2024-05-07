import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minor_sem6/components/default_button.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minor_sem6/size_config.dart';
import 'package:minor_sem6/components/profile_picture.dart';
import 'package:minor_sem6/components/subs_option.dart';
import 'package:http/http.dart' as http;

import 'package:minor_sem6/components/profile_picture.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  SubsMenu(
                    heroText: "Think Fit",
                    amount: "49",
                    planDuration: "  /diet plan",
                    text: "✔️ One Time Diet Plan\n✔️ Single Call Fitness Advice\n⬇️ No Plan Refresh and Follow-ups",
                    icon: "assets/images/plan_think_fit.png",

                  ),
                  SubsMenu(
                    heroText: "Get Fit",
                    amount: "29",
                    planDuration: "  /month",
                    text: "✔️ All Benefits of Think Fit Plan\n✔️ Diet Plan Refresh every fortnight\n✔️ Multiple Fitness Advice Calls &\n Follow-ups",
                    icon: "assets/images/plan_get_fit.png",

                  ),],
              )
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DefaultButton(text: 'Select Plan', press: (){
                // StripePaymentHandle();

              },),
            )
          ],
        ),

      ),
    );
  }
}

// class StripePaymentHandle {
//   Map<String, dynamic>? paymentIntent;
//
//   Future<void> stripeMakePayment() async {
//     try {
//       paymentIntent = await createPaymentIntent('100', 'INR');
//       await Stripe.instance
//           .initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               billingDetails: BillingDetails(
//                   name: 'YOUR NAME',
//                   email: 'YOUREMAIL@gmail.com',
//                   phone: 'YOUR NUMBER',
//                   address: Address(
//                       city: 'YOUR CITY',
//                       country: 'YOUR COUNTRY',
//                       line1: 'YOUR ADDRESS 1',
//                       line2: 'YOUR ADDRESS 2',
//                       postalCode: 'YOUR PINCODE',
//                       state: 'YOUR STATE')),
//               paymentIntentClientSecret: paymentIntent![
//               'client_secret'], //Gotten from payment intent
//               style: ThemeMode.dark,
//               merchantDisplayName: 'Ikay'))
//           .then((value) {});
//
//       //STEP 3: Display Payment sheet
//       displayPaymentSheet();
//     } catch (e) {
//       print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       // 3. display the payment sheet.
//       await Stripe.instance.presentPaymentSheet();
//
//       Fluttertoast.showToast(msg: 'Payment succesfully completed');
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         Fluttertoast.showToast(
//             msg: 'Error from Stripe: ${e.error.localizedMessage}');
//       } else {
//         Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
//       }
//     }
//   }
//
// //create Payment
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       //Request body
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//       };
//
//       //Make post request to Stripe
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       return json.decode(response.body);
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }
//
// //calculate Amount
//   calculateAmount(String amount) {
//     final calculatedAmount = (int.parse(amount)) * 100;
//     return calculatedAmount.toString();
//   }
// }


//
// Future<void> makePayment() async {
//   try {
//     //STEP 1: Create Payment Intent
//     var paymentIntent = await createPaymentIntent('100', 'USD');
//
//     //STEP 2: Initialize Payment Sheet
//     await Stripe.instance
//         .initPaymentSheet(
//
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: paymentIntent![
//             'client_secret'], //Gotten from payment intent
//             style: ThemeMode.light,
//             merchantDisplayName: 'Ikay'))
//         .then((value) {});
//
//     //STEP 3: Display Payment sheet
//     displayPaymentSheet();
//   } catch (err) {
//     throw Exception(err);
//   }
// }
//
// createPaymentIntent(String amount, String currency) async {
//   try {
//     //Request body
//     Map<String, dynamic> body = {
//       'amount': calculateAmount(amount),
//       'currency': currency,
//     };
//
//     //Make post request to Stripe
//     var response = await http.post(
//       Uri.parse('https://api.stripe.com/v1/payment_intents'),
//       headers: {
//         'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
//         'Content-Type': 'application/x-www-form-urlencoded'
//       },
//       body: body,
//     );
//     return json.decode(response.body);
//   } catch (err) {
//     throw Exception(err.toString());
//   }
// }
//
// displayPaymentSheet() async {
//   try {
//     await Stripe.instance.presentPaymentSheet().then((value) {
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Icon(
//                   Icons.check_circle,
//                   color: Colors.green,
//                   size: 100.0,
//                 ),
//                 SizedBox(height: 10.0),
//                 Text("Payment Successful!"),
//               ],
//             ),
//           ));
//
//       var paymentIntent = null;
//     }).onError((error, stackTrace) {
//       throw Exception(error);
//     });
//   } on StripeException catch (e) {
//     print('Error is:---> $e');
//     AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: const [
//               Icon(
//                 Icons.cancel,
//                 color: Colors.red,
//               ),
//               Text("Payment Failed"),
//             ],
//           ),
//         ],
//       ),
//     );
//   } catch (e) {
//     print('$e');
//   }
// }