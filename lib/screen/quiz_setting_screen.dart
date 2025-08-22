import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/button.dart';

class QuizSettingsModal extends StatefulWidget {
  @override
  _QuizSettingsModalState createState() => _QuizSettingsModalState();
}

class _QuizSettingsModalState extends State<QuizSettingsModal> {
  int questionCount = 5;
  String difficulty = 'Easy';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quiz Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8C00),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, size: 18, color: Colors.grey[600]),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Text('How many questions would you like?'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (questionCount > 1) {
                    setState(() {
                      questionCount--;
                    });
                  }
                },
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFF8C00), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.remove, color: Color(0xFFFF8C00), size: 24),
                ),
              ),
              SizedBox(width: 40),
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '$questionCount',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 40),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      questionCount++;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFF8C00), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.add, color: Color(0xFFFF8C00), size: 24),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Text(
            'Select Difficulty',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: difficulty,
                isExpanded: true,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                items: ['Easy', 'Medium', 'Hard'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    difficulty = newValue!;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                dropdownColor: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 40),
          MyButton(
            text: 'Start Quiz',
            color: Color(0xFFFF8C00),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
