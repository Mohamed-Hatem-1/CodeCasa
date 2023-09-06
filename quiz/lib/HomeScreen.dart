import 'package:flutter/material.dart';
import 'package:quiz/MathScreen.dart';
import 'package:quiz/QuestionContainer.dart';
import 'package:quiz/SQLScreen.dart';
import 'package:quiz/GuessScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Let's Play",
              style: TextStyle(color: Colors.deepOrange, fontSize: 48),
            ),
            QuestionContainer(
              title: "Guess The Player",
              subtitle: "5 Questions",
              difficulty: "Easy",
              color: const Color(0xFFD175E4),
              icon: Icons.co_present_sharp,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuessScreen(),
                  ),
                );
              },
            ),
            QuestionContainer(
              title: "Math",
              subtitle: "5 Questions",
              difficulty: "Intermediate",
              color: const Color(0xFFFC6A77),
              icon: Icons.add,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MathScreen(),
                  ),
                );
              },
            ),
            QuestionContainer(
              title: "SQL",
              subtitle: "5 Questions",
              difficulty: "Hard",
              color: const Color(0xFF2F94F6),
              icon: Icons.settings_system_daydream_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SQLScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
