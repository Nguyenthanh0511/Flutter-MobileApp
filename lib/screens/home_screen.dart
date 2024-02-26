import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
// import 'package:quizapp/model/question_model.dart';
import 'package:quizapp/widgets/question_widget.dart';
import 'package:quizapp/widgets/next_button.dart';
import '../model/question_model.dart';
import 'package:quizapp/widgets/options.dart';
import 'package:quizapp/widgets/option.dart';
import 'package:quizapp/widgets/result_box.dart';
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
        Option(value: '20', isCorrect: false),
        Option(value: '7', isCorrect: false),
        Option(value: '10', isCorrect: false),
      ],
      correctAnswer: '4',
    ),
    Question(
      id: '11',
      title: 'What is 5 + 2?',
      // options: {'6', '20', '7', '10'},
      options: [
        Option(value: '3', isCorrect: false),
        Option(value: '2', isCorrect: false),
        Option(value: '7', isCorrect: true),
        Option(value: '1', isCorrect: false),
      ],
      correctAnswer: '7',
    ),
  ];
  int index = 0;
  int score = 0;
  //create boolean value ,when =user click
  bool isPress = false;
  //create function void change color when user click
  bool alreadySelect = false;
  void changeColor() {
    if(isPress) {
      return;
    }
    else{// isPress = false
      setState(() {
        // set state
        isPress = true;
      });
    }
  }
  void checkAnswerAndUpdate(bool value){
    if(alreadySelect){
      return;
    }
    else{
      if(value == true){
        setState((){
          score++;
          isPress = true;
          alreadySelect = true;
        });
      }
    }
  }

  //create function to next question
  void NextQuestion() {
    if (index == _questions.length - 1) {
      // return;
      //This display book of user answer 
      showDialog(context: context, builder: (ctx)=>ResultBox(
        result:score,
        questionLength: _questions.length,
      ));
      //and then create file result
    } else {
      if (isPress) {
        setState(() { // Chuyển đổi trạng thái
          index++;
          isPress = false;
        }); 
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('please click your answer'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Quiz app'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Score: $score'), // Đưa giá trị điểm số vào
            ),
          ],
        ),
        shadowColor: Color.fromRGBO(0, 0, 0, 0.0),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,
              totalQuestions: _questions.length,
            ),
            const Divider(color: neutral), // Thanh kẻ ngang
            const SizedBox(height: 5.0),

            Column(
              children: [
                for (int i = 0; i < _questions[index].options.length; i++)
                  GestureDetector(
                    onTap: () {
                      // Handle the tap event, you can implement your logic here
                      print('Option ${_questions[index].options[i].value} tapped!');
                      // changeColor(); // Add your logic here if needed , 
                      // when user cliced truth and then change color 

                      //check question is truth or false , if the truth and then increase score
                      
                      checkAnswerAndUpdate(_questions[index].options[i].isCorrect);
                    },
                    child: Column(
                      children: [
                        Options( // Xử lý khi người dùng trả lời câu hỏi
                          option: _questions[index].options[i].value,
                          color: isPress
                              ? _questions[index].options[i].isCorrect
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      ],
                    ),
                  ),
              ],
            )
          ]
        ),
      ),
      //use the floating action button
      floatingActionButton: Padding(
        padding: EdgeInsets.all(0.0),
        child: NextButton(
          nextQuestions: NextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
