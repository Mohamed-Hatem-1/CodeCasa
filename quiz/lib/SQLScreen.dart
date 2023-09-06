import 'package:flutter/material.dart';
import 'package:quiz/ResultsScreen.dart';

class SQLScreen extends StatefulWidget {
  const SQLScreen({Key? key}) : super(key: key);

  @override
  State<SQLScreen> createState() => _SQLScreen();
}

class _SQLScreen extends State<SQLScreen> {
  int questionNumber = 0;
  int correctAnswers = 0;
  List<bool> isSelected = [false, false, false, false];

  List<Map<String, dynamic>> quizData = [
    {
      'question':
          'What SQL clause is used to sort the result set in ascending order?',
      'answers': ['SORT', 'ORDER BY', 'ASCENDING', 'GROUP BY'],
      'correctAnswer': 'ORDER BY',
    },
    {
      'question': 'What SQL statement is used to change data in a database?',
      'answers': ['MODIFY', 'ALTER', 'UPDATE', 'CHANGE'],
      'correctAnswer': 'UPDATE',
    },
    {
      'question': 'What SQL command is used to delete data from a database?',
      'answers': ['DELETE', 'REMOVE', 'DROP', 'CLEAN'],
      'correctAnswer': 'DELETE',
    },
    {
      'question': 'Which SQL operator is used to compare values for equality?',
      'answers': ['==', '=', '<>', '!='],
      'correctAnswer': '=',
    },
    {
      'question':
          'What SQL clause is used to group rows that have the same values into summary rows?',
      'answers': ['SUMMARIZE', 'COLLECT', 'AGGREGATE', 'GROUP BY'],
      'correctAnswer': 'GROUP BY',
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
      backgroundColor: const Color(0xFF2F94F6),
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
