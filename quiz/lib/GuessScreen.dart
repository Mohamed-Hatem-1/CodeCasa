import 'package:flutter/material.dart';
import 'package:quiz/ResultsScreen.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({Key? key}) : super(key: key);

  @override
  State<GuessScreen> createState() => _GuessScreen();
}

class _GuessScreen extends State<GuessScreen> {
  int questionNumber = 0;
  int correctAnswers = 0;
  List<bool> isSelected = [false, false, false, false];

  List<Map<String, dynamic>> quizData = [
    {
      'question': 'Which footballer has won the most FIFA Ballon d\'Or awards?',
      'answers': [
        'Cristiano Ronaldo',
        'Lionel Messi',
        'Michel Platini',
        'Marco van Basten'
      ],
      'correctAnswer': 'Lionel Messi',
    },
    {
      'question': 'Who is the all-time top scorer in the FIFA World Cup?',
      'answers': ['Pele', 'Gerd Muller', 'Ronaldo', 'Miroslav Klose'],
      'correctAnswer': 'Miroslav Klose',
    },
    {
      'question':
          'Who is the all-time top scorer in the UEFA Champions League?',
      'answers': [
        'Lionel Messi',
        'Raul',
        'Cristiano Ronaldo',
        'Robert Lewandowski'
      ],
      'correctAnswer': 'Cristiano Ronaldo',
    },
    {
      'question':
          'Who is the captain of the Brazil national football team in the 2022 FIFA World Cup?',
      'answers': ['Neymar', 'Thiago Silva', 'Marquinhos', 'Casemiro'],
      'correctAnswer': 'Neymar',
    },
    {
      'question':
          'Which German footballer is often referred to as "The Kaiser"?',
      'answers': [
        'Lothar Matthäus',
        'Franz Beckenbauer',
        'Oliver Kahn',
        'Miroslav Klose'
      ],
      'correctAnswer': 'Franz Beckenbauer',
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
      backgroundColor: const Color(0xFFD175E4),
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
                style: const TextStyle(fontSize: 28, color: Colors.white),
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
