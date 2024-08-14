import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/text_lambda.dart';
import '../styles/assets.dart';
import '../styles/colors.dart';
import 'components/custom_image_box_chargement_screen.dart';
import 'components/textfield_connection.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController =  TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
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
                  child: const TextLambda(
                    'Ready for a new safe adventure with HerShield?',
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Column(
              children: [
                // Username
                Container(
                  color: textFieldLoginColor,
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  child: TextFieldConnection(
                    controller: usernameController,
                    hintText: 'Enter your username',
                    obscureText: false,
                  ),
                ),
                // Password
                Container(
                  color: textFieldLoginColor,
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                  child: TextFieldConnection(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                ),
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