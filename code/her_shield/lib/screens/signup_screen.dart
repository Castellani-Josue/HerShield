import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/login_signup_btn.dart';

import '../Firestore/users.dart';
import '../styles/assets.dart';
import '../styles/colors.dart';
import 'components/custom_image_box_chargement_screen.dart';
import 'components/text_lambda.dart';
import 'components/textfield_connection.dart';

class SignUpScreen extends StatefulWidget {


  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  String userId = '';
  final TextEditingController usernameController =  TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(chargementbackground),
            fit: BoxFit.cover,
          ),
        ),
        child:  Column(
          children: [
            Expanded(
              flex :1,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(top: 20),
                  icon: const Icon(Icons.arrow_back, size: 35),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),),
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomImageBox(imagePath: appicon),
                    const SizedBox(height: 20),
                    // Ready for a new safe adventure with HerShield?
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 250,
                      ),
                      child:  TextLambda(
                        'Join the HerShield army and travel with peace of mind! ', fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                        flex : 2,
                        child: SingleChildScrollView(
                          child: Column(
                      children:[
                          Container(
                            color: textFieldSignUpColor,
                            margin: const EdgeInsets.only(left: 24, right: 24),
                            child: TextFieldConnection(
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter your username';
                                }
                                return null;
                              },
                              controller: usernameController,
                              hintText: 'Enter your username',
                              obscureText: false,
                            ),
                          ),
                          // Password
                          Container(
                            color: textFieldSignUpColor,
                            margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                            child: TextFieldConnection(
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter your password';
                                }
                                return null;
                              },
                              controller: passwordController,
                              hintText: 'Enter your password',
                              obscureText: true,
                            ),
                          ),
                          // Confirm Password
                          Container(
                            color: textFieldSignUpColor,
                            margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
                            child: TextFieldConnection(
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Confirm your password';
                                }
                                return null;
                              },
                              controller: passwordConfirmController,
                              hintText: 'Confirm your password',
                              obscureText: true,
                            ),
                          ),
                      ]
                    ),
                        )),
                    // Username
                   Expanded(
                       flex: 1,
                       child: Column(
                     children: [
                       LoginSignUpBtn(
                           'Sign Up',
                           onPressed: () async {
                             setState(() {
                               _isLoading = true; // Active le chargement
                             });

                             // Vérifier si les mots de passe correspondent
                             if (passwordController.text != passwordConfirmController.text) {
                               ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                   content: Text('Passwords do not match.'),
                                 ),
                               );
                               setState(() {
                                 _isLoading = false; // Désactive le chargement
                               });
                               return; // Arrête l'exécution si les mots de passe ne correspondent pas
                             }

                             try {
                               await FirebaseAuth.instance
                                   .createUserWithEmailAndPassword(
                                 email: usernameController.text,
                                  password: passwordController.text,
                               )
                                   .then((value) {
                                 Navigator.pushReplacementNamed(context, '/cardIdScan');
                               });
                             } on FirebaseAuthException catch (e) {
                               if (!mounted) return;
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 showCloseIcon: true,
                                 duration: const Duration(seconds: 7),
                                 content: Text(e.message ?? 'An unknown error occurred.'),
                               ));
                             } finally {
                               setState(() {
                                 _isLoading = false; // Désactive le chargement
                                 //addUser(emailController.text);
                                 userId = userId.isEmpty ? usernameController.text : userId;
                                 createUserWithCustomId(userId,usernameController.text);
                               });
                             }
                           },
                           isLoading: _isLoading // Passe l'état de chargement
                       ),
                     ],
                   )),
                    //const SizedBox(height: 15),
                    // Sign Up Button

                  ],
                ),
              ),
            ),
            const Expanded(
                flex : 1,
                child: Center(
                    child : Column(
                      children : [

                      ],
                    )
                ))
          ],
        ),
      )
    );


  }
}