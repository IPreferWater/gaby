import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  const Score(
      {super.key,
      required this.title,
      required this.score,
      required this.allValueSet});

  final String title;
  final int score;
  final bool allValueSet;

  @override
  State<Score> createState() => ScoreState();
}

class ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return widget.allValueSet
        ? Text('${widget.title} : ${widget.score}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 50))
        : Text('${widget.title} : remplissez tous les champs',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 30));
  }
}
