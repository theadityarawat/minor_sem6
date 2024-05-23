// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:minor_sem6/screens/home/home_screen.dart';
// import '/components/custom_surfix_icon.dart';
// import '/components/form_error.dart';
// import '/helper/keyboard.dart';
// import '/screens/forgot_password/forgot_password_screen.dart';
// import '/screens/login_success/login_success_screen.dart';
// import 'package:minor_sem6/constants.dart';
// import '../../../components/default_button.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';
//
// class SignForm extends StatefulWidget {
//   @override
//   _SignFormState createState() => _SignFormState();
// }
//
// class _SignFormState extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   bool showSpinner = false;
//   late String email;
//   late String password;
//   bool? remember = false;
//   final List<String?> errors = [];
//
//   void addError({String? error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }
//
//   void removeError({String? error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           buildEmailFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPasswordFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           GestureDetector(
//             onTap: () =>
//                 Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
//             child: Text(
//               "Forgot Password?",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w500,
//                 // decoration: TextDecoration.underline
//               ),
//             ),
//           ),
//           FormError(errors: errors),
//           SizedBox(height: getProportionateScreenHeight(20)),
//           DefaultButton(
//             text: "Continue",
//             press: () async {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState!.save();
//                 final user = await _auth.signInWithEmailAndPassword(
//                     email: email, password: password);
//                 // if all are valid then go to success screen
//                 KeyboardUtil.hideKeyboard(context);
//                 if (user != null) {
//                   // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset('assets/images/login_success.png'),
//                             Text(
//                               'Success',
//                               style: headingStyleText,
//                             ),
//                             Text(
//                                 'Your tastebuds are recognized successfully. Now you’re logged in.', style: GoogleFonts.dmSans(),
//                             textAlign: TextAlign.center,)
//                           ],
//                         ),
//                         actions: <Widget>[
//                           DefaultButton(
//                             text: "Back to Home",
//                             press: () {
//                               Navigator.pushNamed(context, HomeScreen.routeName); // Close the popup
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   TextFormField buildPasswordFormField() {
//     return TextFormField(
//       obscureText: true,
//       onSaved: (newValue) => password = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kNoPass);
//         } else if (value.length >= 8) {
//           removeError(error: kWeakPass);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kNoPass);
//           return "";
//         } else if (value.length < 8) {
//           addError(error: kWeakPass);
//           return "";
//         }
//         return null;
//       },
//       decoration: kInputDecoration(
//           hintText: 'Password', mySuffixIcon: Icon(Icons.lock_rounded)),
//     );
//   }
//
//   TextFormField buildEmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => email = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kNoMail);
//         } else if (kValidEmail.hasMatch(value)) {
//           removeError(error: kWrongEmailFormat);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kNoMail);
//           return "";
//         } else if (!kValidEmail.hasMatch(value)) {
//           addError(error: kWrongEmailFormat);
//           return "";
//         }
//         return null;
//       },
//       decoration:
//           kInputDecoration(hintText: 'Email', mySuffixIcon: Icon(Icons.mail)),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components/custom_surfix_icon.dart';
import '/components/form_error.dart';
import 'package:minor_sem6/screens/home/home_screen.dart';
import '/helper/keyboard.dart';
import '/screens/login_success/login_success_screen.dart';
import 'package:minor_sem6/constants.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email = '';
  late String password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          GestureDetector(
            onTap: () {
              // resetPassword(email: email);
              _formKey.currentState!.save();
              _resetPassword(email);
            },
            child: Text(
              "Forgot Password?",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                KeyboardUtil.hideKeyboard(context);
                if (user != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/login_success.png'),
                            Text(
                              'Success',
                              style: headingStyleText,
                            ),
                            Text(
                              'Your taste buds are recognized successfully. Now you’re logged in.',
                              style: GoogleFonts.dmSans(),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        actions: <Widget>[
                          DefaultButton(
                            text: "Back to Home",
                            press: () {
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  void _resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      // Show a success message or navigate to a success screen if needed
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password reset email sent. Please check your inbox."),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      print("Failed to send password reset email: $e");
      // Show an error message or handle the error appropriately
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Failed to send password reset email. Check if mail is as per account records.",),
        backgroundColor: Colors.red,
      ));
    }
  }
  Future<AuthStatus> resetPassword({required String email}) async {
    AuthStatus _status = AuthStatus.unknown;
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNoPass);
        } else if (value.length >= 8) {
          removeError(error: kWeakPass);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNoPass);
          return "";
        } else if (value.length < 8) {
          addError(error: kWeakPass);
          return "";
        }
        return null;
      },
      decoration: kInputDecoration(
          hintText: 'Password', mySuffixIcon: Icon(Icons.lock_rounded)),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNoMail);
        } else if (kValidEmail.hasMatch(value)) {
          removeError(error: kWrongEmailFormat);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNoMail);
          return "";
        } else if (!kValidEmail.hasMatch(value)) {
          addError(error: kWrongEmailFormat);
          return "";
        }
        return null;
      },
      decoration:
          kInputDecoration(hintText: 'Email', mySuffixIcon: Icon(Icons.mail)),
    );
  }
}

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status = AuthStatus.unknown;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}
