import 'package:flutter/material.dart'; // Import the Material library from Flutter

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key, // Define a const constructor for the widget
      required this.question, // Define a required parameter for the question
      required this.indexAction, // Define a required parameter for the indexAction
      required this.totalQuestions // Define a required parameter for the totalQuestions
  }) : super(key: key); // Define the superclass as StatelessWidget

  final String question; // Define a String variable for the question // Câu hỏi
  final int indexAction; // Define an int variable for the indexAction // Số dòng của hành động câu hỏi
  final int totalQuestions; // Define an int variable for the totalQuestions // Số tổng câu hỏi

  @override
  Widget build(BuildContext context) { // Define a build method for the widget
    return Container(
      alignment: Alignment.centerLeft, // Define the alignment as center left
      child: Text('Question ${indexAction + 1}/$totalQuestions: $question', // Define a Text widget with the question and its index
      style: TextStyle(
        fontSize: 20.0, // Define the font size as 20.0
        fontWeight: FontWeight.bold, // Define the font weight as bold  
        fontStyle: FontStyle.italic, // Define the font style as italic
        color: Color.fromARGB(255, 168, 184, 197), // Define the text color as blue
        // decoration: TextDecoration.underline, // Define the text decoration as underline
        decorationColor: const Color.fromARGB(255, 86, 86, 86) // Define the text decoration color as red
      ),
      ),
    ); // Return a Container widget with the text and its style
  }
}