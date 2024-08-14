import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:her_shield/cubit/chargement_screen_cubit.dart';
import 'package:her_shield/screens/signup_screen.dart';
import 'package:her_shield/screens/components/circular_progress_indicator.dart';
import 'package:her_shield/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_shield/screens/components/custom_image_box_chargement_screen.dart';

import '../styles/assets.dart';
import 'login_page.dart';
import 'home_screen.dart';

class ChargementScreen extends StatelessWidget {
  const ChargementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      routes: {
        '/start': (context) => const ChargementScreen(),
        '/SingUp': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ChargementScreenCubit(),
        child: BlocBuilder<ChargementScreenCubit, ChargementScreenState>(
          builder: (context, state) {
            if (state is ChargementScreenInitial) {
              return Scaffold(
                backgroundColor: backgroundColor,
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(chargementbackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Center(
                                child: CustomImageBox(imagePath: appicon)
                            )
                        ),
                        Expanded(  flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomCircularProgressIndicator()
                            ],
                          ),)
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: backgroundColor,
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(chargementbackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:  Center(
                    child:
                    LoginPage(),
                       ),
                    ),
              );
            }
          },
        ),
      ),
    );
  }
}