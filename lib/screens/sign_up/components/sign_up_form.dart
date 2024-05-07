import 'package:flutter/material.dart';
import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '/components/form_error.dart';
// import '/screens/complete_profile/complete_profile_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String conform_password;
  bool remember = false;

  final _auth = FirebaseAuth.instance;

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
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
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                // if all are valid then go to success screen
                if (newUser != null) {
                  // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Account created successfully"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                  // You can navigate to the success screen here
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => conform_password = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNoPass);
          } else if (value.isNotEmpty && password == conform_password) {
            removeError(error: kPassMismatch);
          }
          conform_password = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kNoPass);
            return "";
          } else if ((password != value)) {
            addError(error: kPassMismatch);
            return "";
          }
          return null;
        },
        decoration: kInputDecoration(
            hintText: "Re-enter your password",
            mySuffixIcon: Icon(Icons.password)));
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
          password = value;
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
            hintText: "Enter your password",
            mySuffixIcon: Icon(Icons.password)));
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
          return null;
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
        decoration: kInputDecoration(
            hintText: "Enter your email", mySuffixIcon: Icon(Icons.mail)));
  }
}
