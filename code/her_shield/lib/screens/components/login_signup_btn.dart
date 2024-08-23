import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/text_lambda.dart';
import 'package:her_shield/styles/colors.dart';

class LoginSignUpBtn extends ElevatedButton {


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
}