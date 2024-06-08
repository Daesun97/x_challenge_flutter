import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/consent_screen.dart';
import 'package:x_challenge/features/authentication/confirmation_screen.dart';
import 'package:x_challenge/features/authentication/create_account_screen.dart';
import 'package:x_challenge/features/authentication/inital_screen.dart';
import 'package:x_challenge/features/authentication/login_screen.dart';
import 'package:x_challenge/features/onboarding/interest_detail_screen.dart';
import 'package:x_challenge/features/onboarding/interests_screen.dart';
import 'package:x_challenge/features/widget/pincodestate.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PinCodeState()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Clone',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          primaryColor: const Color.fromARGB(255, 53, 173, 241),
          scaffoldBackgroundColor: Colors.white),
      home: const InitialScreen(),
    );
  }
}
