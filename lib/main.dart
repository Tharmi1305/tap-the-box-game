import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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
  double boxX=150;
  double boxY=150;
  int timeLeft=30;

  @override
  void initState(){
    super.initState();
    startTimer();
  }

  void startTimer(){
    Timer.periodic(const Duration(seconds:1), (timer){
      setState(() {
        if (timeLeft > 0){
          timeLeft--;
        } else{
          timer.cancel();
        }
      });
    });
  }

  void restartGame(){
    setState(() {
      score=0;
      timeLeft=30;
      boxX=150;
      boxY=150;
    });
    startTimer();
  }

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
            top: 90,
            left: 20,
            child: Text(
              "Time: $timeLeft",
              style: const TextStyle(fontSize: 24),
            ),
          ),

          Positioned(
            top: boxY,
            left: boxX,
            child: GestureDetector(
              onTap:() {
                setState(() {
                  score++;

                  final random = Random();
                  boxX = random.nextDouble() * 300;
                  boxY = random.nextDouble() * 500;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),

          if (timeLeft == 0)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Game Over",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: restartGame,
                    child: const Text("Restart Game"),
                  ),
                ],
              ),
            ),
        ],
      )
    );
  }
}



