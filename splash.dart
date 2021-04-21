import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizstar/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          " Take quizQuiz\nT!!est Yourself !!",
          style: TextStyle(
            fontSize: 60.0,
            color: Colors.white,

          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}