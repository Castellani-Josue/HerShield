import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/text_lambda.dart';
import 'package:her_shield/styles/colors.dart';

class LoginSignUpBtn extends ElevatedButton {
  LoginSignUpBtn(String data, {
    Key? key,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) : super(
    key: key,
    onPressed: isLoading ? null : onPressed, // Désactive le bouton si en chargement
    child: isLoading
        ? const CircularProgressIndicator(
      color: Colors.white,
    ) // Affiche un indicateur de chargement
        : TextLambda(data, fontSize: 14.0),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(15),
      ),
    ),
  );
}



/*class LoginSignUpBtn extends ElevatedButton {


  LoginSignUpBtn(String data, {Key? key, required onPressed}) : super(
    key: key,
    onPressed: onPressed,
    child: TextLambda(data, fontSize: 14.0),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(15),
      ),
    ),
  );
}*/