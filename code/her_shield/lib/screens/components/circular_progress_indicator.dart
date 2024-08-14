
import 'package:flutter/material.dart';
import 'package:her_shield/styles/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: Colors.white,
      ),
    );
  }
}