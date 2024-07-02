import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      routes: {
        '/start': (context) => const ChargementScreen(),
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
                      image: AssetImage(backgroundchargement2),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageBox(imagePath: appicon),
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
                      image: AssetImage(backgroundchargement2),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
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
                                  appicon,
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
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
