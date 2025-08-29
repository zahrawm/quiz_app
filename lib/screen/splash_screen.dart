import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/shared_preferences_provider.dart';
import 'package:quiz_app/screen/home_screen.dart';
import 'package:quiz_app/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final userPrefs = Provider.of<UserPreferencesProvider>(
      context,
      listen: false,
    );
    await userPrefs.initPreferences();

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      if (userPrefs.isFirstTime || userPrefs.firstName.isEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFE950B),
      body: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/logo.png", fit: BoxFit.cover),
                  ),
                ),
                const Center(
                  child: Text(
                    'Quizzia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Developed by Fatimah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
