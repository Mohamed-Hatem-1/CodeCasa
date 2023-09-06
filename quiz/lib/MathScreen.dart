import 'package:flutter/material.dart';
import 'package:quiz/ResultsScreen.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({Key? key}) : super(key: key);

  @override
  State<MathScreen> createState() => _MathScreen();
}

class _MathScreen extends State<MathScreen> {
  int questionNumber = 0;
  int correctAnswers = 0;
  List<bool> isSelected = [false, false, false, false];

  List<Map<String, dynamic>> quizData = [
    {
      'question': 'What is the square root of 144?',
      'answers': ['9', '6', '12', '16'],
      'correctAnswer': '12',
    },
    {
      'question': 'What is the value of π (pi) to two decimal places?',
      'answers': ['3.14', '3.16', '3.12', '3.18'],
      'correctAnswer': '3.14',
    },
    {
      'question': 'What is the value for x: 2x + 5 = 11.',
      'answers': ['4', '3', '6', '2'],
      'correctAnswer': '3',
    },
    {
      'question': 'What is the result of 6! (6 factorial)?',
      'answers': ['120', '360', '5040', '720'],
      'correctAnswer': '720',
    },
    {
      'question': 'What is the sum of the interior angles of a triangle?',
      'answers': ['90 degrees', '360 degrees', '180 degrees', '120 degrees'],
      'correctAnswer': '180 degrees',
    },
  ];

  void checkAnswer(String selectedAnswer) {
    if (quizData[questionNumber]['correctAnswer'] == selectedAnswer) {
      setState(() {
        correctAnswers++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFC6A77),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Question number ${questionNumber + 1}",
              style: const TextStyle(fontSize: 24, color: Colors.white70),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 5),
              child: Text(
                quizData[questionNumber]['question'],
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  quizData[questionNumber]['answers'].length,
                  (index) {
                    final answer = quizData[questionNumber]['answers'][index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = List.generate(4, (_) => false);
                            isSelected[index] = true;
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 370,
                          decoration: BoxDecoration(
                            color:
                                isSelected[index] ? Colors.lime : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              answer,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final selectedAnswerIndex = isSelected.indexOf(true);
                if (selectedAnswerIndex != -1) {
                  checkAnswer(
                      quizData[questionNumber]['answers'][selectedAnswerIndex]);
                  if (questionNumber < quizData.length - 1) {
                    setState(() {
                      questionNumber++;
                      isSelected = [false, false, false, false];
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultsScreen(correctAnswers: correctAnswers),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Please select an answer before submitting.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                fixedSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
