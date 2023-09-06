import 'package:flutter/material.dart';
import 'package:quiz/HomeScreen.dart';

class ResultsScreen extends StatelessWidget {
  final int correctAnswers;

  const ResultsScreen({super.key, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.lightBlueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Your Score is",
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
              Text(
                "$correctAnswers of 5",
                style: const TextStyle(fontSize: 80, color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 65,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      height: 60,
                      width: 195,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlueAccent,
                      ),
                      child: const Center(
                          child: Text(
                        "Try Again",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
