import 'package:flutter/material.dart';
import 'package:her_shield/cubit/chargement_screen_cubit.dart';
import 'package:her_shield/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_shield/styles/custom_image_box_chargement_screen.dart';

import '../styles/assets.dart';
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
      home:  BlocProvider(
        create: (context) => ChargementScreenCubit(),
        child: BlocBuilder<ChargementScreenCubit, ChargementScreenState>(
          builder: (context, state) {
            if (state is ChargementScreenInitial) {
              return  const Scaffold(
              backgroundColor: backgroundColor,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageBox(imagePath: appli_icon),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: backgroundColor,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'assets/images/playstore.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: backgroundColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
      )),
    );
  }
}