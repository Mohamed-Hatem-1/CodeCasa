import 'package:flutter/material.dart';
import 'package:quiz/HomeScreen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 300,
          child: Column(
            children: [
              const Text(
                "QuizApp",
                style: TextStyle(color: Colors.pinkAccent, fontSize: 60),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Challenging Questions\n\t\t\t\t\t\tfor Programmers",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 16)),
              const SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "START",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
