import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
// import 'package:quizapp/model/question_model.dart';
import 'package:quizapp/widgets/question_widget.dart';
// import '../widgets/question_widget.dart';
import '../model/question_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
       id: '10',
       title: 'What is 1 + 3?',
     // options: {'5', '30', '4', '20'},
       options: {'6': 'six', '20': 'twenty', '7': 'seven', '10': 'ten'},
       correctAnswer: '4',
     ),
     Question(
       id: '11',
       title: 'What is 5 + 2?',
     // options: {'6', '20', '7', '10'},
       options: {'3': 'six', '2': 'twenty', '7': 'seven', '10': 'ten'},
       correctAnswer: '7',
     ),
  ];
    int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz app'),
        // backgroundColor: background,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.0), // Setting alpha to 0.0 makes it transparent
      ),
         body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            children: [
              QuestionWidget(
                indexAction: index,
                question: _questions[index].title,
                totalQuestions: _questions.length,
              ),
              const Divider(color:neutral)   // Thanh kẻ ngang
            ],
          ),
        ),
    );
  } 
}

class Question {
  final String id;
  // Every question will have a title and the question itself.
  final String title;
  // Every question will have options.
  final Map<String, String> options;
  // Options will be like (1 true, 2 false) = something like these.
  final String correctAnswer;

  // Constructor for the Question class.
  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.correctAnswer,
  });

  // Override the toString method to provide a string representation of the object.
  // This is useful for debugging purposes.
  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options, correctAnswer: $correctAnswer)';
  }
}

