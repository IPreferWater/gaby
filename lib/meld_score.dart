import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gaby/row_tab.dart';
import 'dart:math';

class TodoName {
  String title;
  List<RowTabOpts> rowTabOpts;
  final ValueChanged<int> onValueChanged;

  TodoName(
      {required this.title,
      required this.rowTabOpts,
      required this.onValueChanged});
}

class MeldScore extends StatefulWidget {
  const MeldScore({super.key});

  @override
  State<MeldScore> createState() => _MeldScoreState();
}

class _MeldScoreState extends State<MeldScore> {
  //Formule: MELD = 3,78 x ln( bilirubine [mg/dl] ) + 11,2 x ln( INR ) + 9,57 x ln( créatinine [mg/dl] ) + 6,43.
  double _bilirubine = 0;
  double _inr = 0;
  double _creatinine = 0;

  double calculateScore() {
    return (3.78 * log(_bilirubine)) +
        11.2 * log(_inr) +
        9.57 * log(_creatinine);
  }

  bool isAllValuesSet() {
    return _bilirubine != 0 && _inr != 0 && _creatinine != 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: Column(
        children: [
          // if are values are set, show the score
          isAllValuesSet() == true
              ? Text('Child score : ${calculateScore()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 50))
              //if some values are missing, display warning message
              : Text('Child score : check all values}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 30)),

                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: 'What do people call you?',
                                  labelText: 'Name *',
                                ),
                      onChanged: (text) {
                        print('BLA $text');
                      },
                    ),
        ],
      ),
    );
  }
}
