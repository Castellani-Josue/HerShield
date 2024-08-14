import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class TextLambda extends Text {
  const TextLambda(String data, {Key? key}) : super(data, key: key,
    style: const TextStyle(
      color: textChargementColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Times New Roman',
    ),
    softWrap: true,
    textAlign: TextAlign.center,
  );
}