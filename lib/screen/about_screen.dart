import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/button.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _otherNamesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _otherNamesController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: screenWidth * 0.06,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'About Me',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            CustomInputField(
              labelText: 'Enter your first name',
              controller: _firstNameController,
              hintText: 'First name',
              isRequired: true,
            ),

            SizedBox(height: screenHeight * 0.025),

            CustomInputField(
              labelText: 'Enter your other names',
              controller: _otherNamesController,
              hintText: 'Other names',
            ),

            SizedBox(height: screenHeight * 0.025),

            CustomInputField(
              labelText: 'Describe yourself',
              controller: _descriptionController,
              hintText: 'Tell us about yourself...',
              maxLines: 4,
            ),

            SizedBox(height: screenHeight * 0.05),

            MyButton(
              text: 'Submit',
              color: Color(0xFFFE950B),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
