import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/about_screen.dart';
import 'package:quiz_app/screen/categories.dart';
import 'package:quiz_app/screen/home_screen.dart';
import 'package:quiz_app/screen/onboarding_screen.dart';
import 'package:quiz_app/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboard': (_) => const OnboardingScreen(),
        '/about': (_) => const AboutMeScreen(),
        '/home': (_) => const HomeScreen(),
        '/categories' :(_) =>  Categories()
      },
    );
  }
}
