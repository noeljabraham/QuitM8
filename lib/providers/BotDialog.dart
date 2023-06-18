import 'package:flutter/material.dart';

class BotDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Bot'),
          children: [
            _buildQuestion(context, 'Question 1', 'Answer 1'),
            _buildQuestion(context, 'Question 2', 'Answer 2'),
            _buildQuestion(context, 'Question 3', 'Answer 3'),
            // Add more questions and answers here
          ],
        );
      },
    );
  }

  static Widget _buildQuestion(
      BuildContext context, String question, String answer) {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.pop(context);
        _showAnswerDialog(context, question, answer);
      },
      child: Text(question),
    );
  }

  static void _showAnswerDialog(
      BuildContext context, String question, String answer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(question),
          content: Text(answer),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
