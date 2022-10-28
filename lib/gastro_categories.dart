import 'package:flutter/material.dart';
import 'package:gaby/blatchford_score.dart';
import 'package:gaby/child_score.dart';
import 'package:gaby/meld_score.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChildScore()));
            },
            child: const Text('Score de Child'),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MeldScore()));
            },
            child: const Text('Score de Meld'),
          ),
        ),
                Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BlatchfordScore()));
            },
            child: const Text('Score de Blatchford'),
          ),
        )
      ]),
    );
  }
}
