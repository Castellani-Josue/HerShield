import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class TextLambda extends Text {
   TextLambda(String data, {Key? key, required fontSize}) : super(data, key: key,
    style:  TextStyle(
      color: textChargementColor,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Times New Roman',
    ),
    softWrap: true,
    textAlign: TextAlign.center,
  );
}