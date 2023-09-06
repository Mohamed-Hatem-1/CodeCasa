import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String difficulty;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const QuestionContainer({super.key,
    required this.title,
    required this.subtitle,
    required this.difficulty,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 200,
          width: 330,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 10)],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        subtitle,
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 60),
                      child: Text(
                        'Difficulty: $difficulty',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                icon,
                size: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
