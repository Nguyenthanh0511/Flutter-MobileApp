
import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
// import 'package:quizapp/model/question_model.dart';
import 'package:quizapp/widgets/question_widget.dart';
import 'package:quizapp/widgets/next_button.dart';
import '../model/question_model.dart';
import 'package:quizapp/widgets/options.dart';
import 'package:quizapp/widgets/option.dart';
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
        options: [
          Option(value: '4', isCorrect: true),
          Option(value: '20',isCorrect:false),
          Option(value: '7',isCorrect:false),
          Option(value: '10',isCorrect:false),
        ],
        correctAnswer: '4',
      ),
     Question(
       id: '11',
       title: 'What is 5 + 2?',
     // options: {'6', '20', '7', '10'},
         options: [
          Option(value: '3', isCorrect: false),
          Option(value: '2',isCorrect:false),
          Option(value: '7',isCorrect:true ),
          Option(value: '1',isCorrect:false),
        ],
       correctAnswer: '7',
     ),
  ];
    int index = 0;
    //create function to next question 
    void NextQuestion(){
      if(index == _questions.length-1){
        return;
      }
      else{
        setState((){
          index++;
        });
      }
    }
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
              const Divider(color:neutral) ,  // Thanh kẻ ngang
              const SizedBox(height: 5.0),
             Column(
                children: [
                  for (int i = 0; i < _questions[index].options.length; i++) 
                  // if(_questions[index].options.values.toList()[i].isEmpty)
                    Column(
                      children: [
                        Options(
                          option: _questions[index].options[i].value,   // option là một thuộc tính của lớp Options ( thông qua options chúng ta sẽ style cho nó)
                          color: _questions[index ].options[i].isCorrect ?
                          correct:incorrect,
                        ),
                        // Card(
                        //   child: Text(_questions[index].options.values.toList()[i]),
                        // ),
                      ],
                    ),
                ],
              ),

            ], 
          ),
        ),
        //use the floating action button 
        floatingActionButton: Padding(
          padding : EdgeInsets.all(0.0),
          child:NextButton(
            nextQuestions: NextQuestion,
          ),


        ),
        floatingActionButtonLocation : FloatingActionButtonLocation.centerFloat,
    );
  } 
}

class Question {
  final String id;
  // Every question will have a title and the question itself.
  final String title;
  // Every question will have options.
  final List<Option> options;
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

