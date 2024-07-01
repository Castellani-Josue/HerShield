import 'package:flutter/material.dart';

import 'home_screen.dart';

class ChargementScreen extends StatelessWidget {
  const ChargementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/start': (context) => const ChargementScreen(),
        'home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),);
  }
}