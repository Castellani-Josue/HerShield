import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/login_signup_btn.dart';

import '../styles/assets.dart';
import '../styles/colors.dart';
import 'components/custom_image_box_chargement_screen.dart';
import 'components/text_lambda.dart';
import 'components/textfield_connection.dart';

class SignUpScreen extends StatelessWidget {

  final TextEditingController usernameController =  TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(chargementbackground),
            fit: BoxFit.cover,
          ),
        ),
        child:  Column(
          children: [
            Expanded(
              flex :1,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(top: 20),
                  icon: const Icon(Icons.arrow_back, size: 35),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),),
            Expanded(
              flex: 6,
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
                        'Join the HerShield army and travel with peace of mind! ', fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Username
                      Container(
                        color: textFiieldSignUpColor,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFieldConnection(
                          controller: usernameController,
                          hintText: 'Enter your username',
                          obscureText: false,
                        ),
                      ),
                      // Password
                      Container(
                        color: textFiieldSignUpColor,
                        margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                        child: TextFieldConnection(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          obscureText: true,
                        ),
                      ),
                      // Confirm Password
                      Container(
                        color: textFiieldSignUpColor,
                        margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                        child: TextFieldConnection(
                          controller: passwordConfirmController,
                          hintText: 'Confirm your password',
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Sign Up Button
                      LoginSignUpBtn('Sign Up', onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
                flex : 1,
                child: Center(
                    child : Column(
                      children : [

                      ],
                    )
                ))
          ],
        ),
      )
    );


  }
}