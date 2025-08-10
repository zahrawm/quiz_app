import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {});
    });

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFE950B),
      body: Column(
        children: [
          Expanded(flex: 1, child: SizedBox()),

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
                Center(
                  child: Text(
                    'Quizzia',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Developed by Fatimah',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
