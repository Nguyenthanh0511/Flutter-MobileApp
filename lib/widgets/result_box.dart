import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
  }) : super(key: key);

  final int result;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(height: 10.0),
            CircleAvatar(
              child: Text('$result/$questionLength'),
            ), // Properly close CircleAvatar
          ],
        ),
      ),
    );
  }
}
