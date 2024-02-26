import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
class NextButton extends StatelessWidget{
  const NextButton ({Key ?key,required this.nextQuestions}) : super(key:key);
  final VoidCallback nextQuestions;

@override 
Widget build(BuildContext context){
  return GestureDetector(
    onTap:nextQuestions,
    child: Container(
      width : double.infinity,
      decoration: BoxDecoration(
      color: neutral,
      // image: const DecorationImage(
      //   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      //   fit: BoxFit.cover,
      // ),
      border: Border.all(
        width: 8,   
      ),
      borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child:Text(
        'Next button' ,
        textAlign :TextAlign.center,
      ),
    ),
  );  
}
}

