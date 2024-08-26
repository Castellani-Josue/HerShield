import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class TextFieldConnection extends TextField {

  final FormFieldValidator<String> validator;

   TextFieldConnection( {Key? key,required TextEditingController controller,
    required hintText,
     required obscureText,
     required this.validator,
   }) : super(key: key,
    controller: controller,
    obscureText: obscureText,
    cursorColor: primaryColor,
    decoration: InputDecoration(
      hintText: hintText,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: textFieldLoginColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: textFieldLoginFocusedBorderColor
        ),
      ),
      fillColor: textFieldLoginFillColor,
      filled: true,
    ),
  );
}
