import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../styles/assets.dart';
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
    // final BuildContext context = this.context; // Capture context locally
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password reset email has been sent to your email address'),


      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        showCloseIcon: true,
        duration: const Duration(seconds: 5),
        content: Text(e.message!),
      ));
    }
  }




}



