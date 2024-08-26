import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/login_signup_btn.dart';
import 'package:her_shield/screens/components/text_forgot_password.dart';
import 'package:her_shield/screens/components/text_lambda.dart';
import '../styles/assets.dart';
import '../styles/colors.dart';
import '../styles/text.dart';
import 'components/custom_image_box_chargement_screen.dart';
import 'components/textfield_connection.dart';

class LoginPage extends StatefulWidget {

   const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =  TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex : 1 , child : Container(),),
        Expanded(
          flex: 3,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImageBox(imagePath: appicon),
                const SizedBox(height: 20),
                // Ready for a new safe adventure with HerShield?
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 250,
                  ),
                  child:  TextLambda(
                    'Ready for a new safe adventure with HerShield?', fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: Column(
              children: [
                // Username
                Container(
                  color: textFieldLoginColor,
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  child: TextFieldConnection(
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return textEnterEmail;
                      }
                      return null;
                    },
                    controller: usernameController,
                    hintText: 'Enter your email',
                    obscureText: false,
                  ),
                ),
                // Password
                Container(
                  color: textFieldLoginColor,
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                  child: TextFieldConnection(
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return textEnterPassword;
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                ),
                // Forgot password?
                const SizedBox(height: 10),
                  Align(
                  alignment: Alignment.centerRight, // Aligner à gauche
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onTap: () {
                        },
                        child: TextForgotPassword('Forgot password?', fontSize: 11.5)
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Login button
                LoginSignUpBtn(
                  'Login',
                  onPressed: () async {
                    setState(() {
                      _isLoading = true; // Active le chargement
                    });

                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: usernameController.text,
                        password: passwordController.text,
                      )
                          .then((value) {
                        Navigator.pushReplacementNamed(context, '/home');
                      });
                    } on FirebaseAuthException catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        showCloseIcon: true,
                        duration: const Duration(seconds: 7),
                        content: Text(e.message ?? 'An unknown error occurred.'),
                      ));
                    } finally {
                      setState(() {
                        _isLoading = false; // Désactive le chargement
                      });
                    }
                  },
                  isLoading: _isLoading // Passe l'état de chargement
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/SignUp');
                  },
                 child: TextLambda('Don\'t have an account? Sign up!', fontSize: 13.0),
                )
              ],
            ),
          ),
        ),
        const Expanded(flex : 1,child: Center(
          child : Column(
            children : [

            ],
          )
        ))
      ],
    );
  }
}
