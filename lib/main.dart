// ignore_for_file: unused_import

import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:money/src/config/index.dart';
import 'package:money/src/presentation/screen/home/home_screen.dart';
import 'package:money/src/presentation/screen/sign-in/sign_in_screen.dart';
import 'package:money/src/presentation/screen/sign-up/sign_up_screen.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:money/src/presentation/screen/profile/profile_screen.dart';
import 'package:money/src/presentation/screen/splash/splash_screen.dart';
import 'package:money/src/presentation/screen/welcome/welcome_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  await Config().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthState(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xFF2743FB),
          fontFamily: 'Roboto`',
        ),
        home: const SplashScreen(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => const SignUp());
            case '/signin':
              return MaterialPageRoute(builder: (_) => SignIn());
            case '/welcome':
              return MaterialPageRoute(builder: (_) => const WelcomeScreen());
            case '/home':
              return MaterialPageRoute(builder: (_) => const Home());
            default:
              return MaterialPageRoute(builder: (_) => const SplashScreen());
          }
        },
      ),
    );
  }
}
