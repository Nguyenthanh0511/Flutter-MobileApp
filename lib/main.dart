import 'package:flutter/material.dart';
import 'package:quizapp/screens/home_screen.dart';

void main(){
  runApp(
    const MyApp(), // will create thís below
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomeScreen(), // Gọi đến sử dụng HomeScreen()
      
    );
  }
}