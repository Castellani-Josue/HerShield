import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../styles/assets.dart';
import 'chargement_screen.dart';
import 'components/custom_image_box_chargement_screen.dart';
import 'components/login_signup_btn.dart';
import 'components/text_lambda.dart';
import 'components/textfield_connection.dart';

class PasswordForgotScreen extends StatefulWidget {
  const PasswordForgotScreen({Key? key}) : super(key: key);

  @override
  PasswordForgotScreenState createState() => PasswordForgotScreenState();
}

class PasswordForgotScreenState extends State<PasswordForgotScreen> {

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(

      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(chargementbackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
             Expanded(flex : 1,child: Center( child :
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImageBox(imagePath: appicon),
                  const SizedBox(height: 20.0),
                  TextLambda('Password Forgot ?', fontSize: 20.0),
                ],
              ),
            ),),
            Expanded(flex : 2,child: Center( child : Column(
              children: [
                TextLambda(
                  "Enter your email to reset your password",
                  fontSize: 18.0,
                ),
                const SizedBox(height: 70.0),
                TextFieldConnection(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                LoginSignUpBtn(
                  "Reset Password",
                  onPressed: resetPassword,
                ),
              ],
            ),),),
          ],
        ),
      ),
    );

  Future<void> resetPassword() async {

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      // Show redirection message dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  TextLambda('Redirecting', fontSize: 16.0),
            content: TextLambda('You will be redirected to the login screen shortly.', fontSize: 14.0),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the redirection dialog
                },
                child: TextLambda('Close', fontSize: 12.0,),
              ),
            ],
          );
        },
      );

      // Wait for 3 seconds before navigating
      await Future.delayed(const Duration(seconds: 3));

      // Close the redirection dialog
      Navigator.of(context, rootNavigator: true).pop();


      // Navigate to the ChargementScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChargementScreen()), // Remplacez ChargementScreen par le nom de votre écran de chargement
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop(); // Close the loading dialog on error

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        showCloseIcon: true,
        duration: const Duration(seconds: 5),
        content: Text(e.message!),
      ));
    }
  }



}



