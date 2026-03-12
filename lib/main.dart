import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tap The Box Game',
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  int score = 0;
  double boxX=0;
  double boxY=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              "Score : $score",
              style: const TextStyle(fontSize: 24),
            ),
          ),

          Positioned(
            top: boxX,
            left: boxY,
            child: GestureDetector(
              onTap:() {
                setState(() {
                  score++;

                  final random = Random();
                  boxX = random.nextDouble() * 300;
                  boxY = random.nextDouble() * 300;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          )
        ],
      )
    );
  }
}



