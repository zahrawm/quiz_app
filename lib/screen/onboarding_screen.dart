import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/board.png'),
            SizedBox(height: 20),
            Text(
              "Quizzia helps you to challenge and assess your\nknowledge in any field of study",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "We have got various categories of quizzes, including\nmathematics, science, anime, music and so on\nmuch more let get started now",
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Center(
              child: MyButton(
                text: 'Get Started',
                color: Color(0xFFFE950B),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/about');
                },
              ),
            ),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 12),
                children: [
                  const TextSpan(
                    text: 'By clicking Get Started, you agree to our ',
                  ),
                  const TextSpan(
                    text: 'Terms of Services',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: ' and\n'),
                  const TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
