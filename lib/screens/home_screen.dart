import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/model/question_model.dart';
//create the HomeScreen widget 
//I'm talking the Stateful widget because it's going to be our parent widget and all the functions 
//and variables will be in this widget so we need to change state of our widget .
class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key:key);

  @override 
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  // List<Question> _questions = [
  //   Question(
  //     id:'10',
  //     title: 'wwhat is 1 + 3 ?',
  //     options :{'5',false , '30':false , '4' : true , '10':false},
  //   ),
  //   Question(
  //     id:'11',
  //     title: 'wwhat is 5 + 2 ?',
  //     options :{'6',false , '20':false , '7' : true , '10':false},
  //   ),
    

  // ]
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz app'),
        // backgroundColor: background,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.0), // Setting alpha to 0.0 makes it transparent
      ),
    );
  }
}