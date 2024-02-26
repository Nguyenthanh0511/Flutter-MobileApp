import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
class Options extends StatelessWidget {
  const Options({Key? key,required this.option,required this.color}) : super(key: key);
  final String option;
  final Color color;
  // final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
      // onTap: onTap, // using with changeColor when user click answer 
      return Card(
        color:color,
        child:ListTile(
          title : Text(
            option ,
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 20.0,
            )
          )
        )
      );
      
    // );
  }

}
