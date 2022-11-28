import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaby/const/international.dart';
import 'package:gaby/widgets/row_tab.dart';
import 'package:gaby/const/const.dart';
import 'package:gaby/widgets/score.dart';

class TodoName {
  String title;
  List<RowTabOpts> rowTabOpts;
  final ValueChanged<int> onValueChanged;

  TodoName(
      {required this.title,
      required this.rowTabOpts,
      required this.onValueChanged});
}

class ChildScore extends StatefulWidget {
  const ChildScore({super.key});

  @override
  State<ChildScore> createState() => _ChildScoreState();
}

class _ChildScoreState extends State<ChildScore> {
  int _ascite = -1;
  int _bilirubine = -1;
  int _albumine = -1;
  int _inr_tp = -1;
  int _encephalopathie = -1;

  int calculateScore() {
    return _ascite + _bilirubine + _albumine + _inr_tp + _encephalopathie;
  }

  bool isAllValuesSet() {
    return _ascite != -1 &&
        _bilirubine != -1 &&
        _albumine != -1 &&
        _inr_tp != -1 &&
        _encephalopathie != -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Child score")),
      body: Column(
        children: [
          Score(
              title: "Child score",
              score: calculateScore(),
              allValueSet: isAllValuesSet()),
          Expanded(
              child: ListView(
            children: [
              RowTab(
                  title: ASCITE.map[Languages.fr]!,
                  dico: ASCITE,
                  options: [
                    RowTabOpts(title: "absent", value: 1),
                    RowTabOpts(title: "modérée", value: 2),
                    RowTabOpts(title: "tendu", value: 3),
                  ],
                  onValueChanged: (int value) {
                    setState(() {
                      _ascite = value;
                    });
                  }),
              RowTab(
                  title: BILBURINE.map[Languages.fr]!,
                  dico: BILBURINE,
                  options: [
                    RowTabOpts(title: "<35", value: 1),
                    RowTabOpts(title: "35-50", value: 2),
                    RowTabOpts(title: ">50", value: 3)
                  ],
                  onValueChanged: (int value) {
                    setState(() {
                      _bilirubine = value;
                    });
                  }),
              RowTab(
                  title: ALBUMINE.map[Languages.fr]!,
                  dico: ALBUMINE,
                  options: [
                    RowTabOpts(title: ">35", value: 1),
                    RowTabOpts(title: "28-35", value: 2),
                    RowTabOpts(title: "<28", value: 3)
                  ],
                  onValueChanged: (int value) {
                    setState(() {
                      _albumine = value;
                    });
                  }),
              RowTab(
                  title: '${INR.map[Languages.fr]!} (TP)',
                  dico: INR,
                  options: [
                    RowTabOpts(title: "<1.7 (>50%)", value: 1),
                    RowTabOpts(title: "1.7-2.2 (40-50%)", value: 2),
                    RowTabOpts(title: ">2.2 (<40%)", value: 3)
                  ],
                  onValueChanged: (int value) {
                    setState(() {
                      _inr_tp = value;
                    });
                  }),
              RowTab(
                  title: '${ENCEPHALOPATHIE.map[Languages.fr]!} (TP)',
                  dico: ENCEPHALOPATHIE,
                  options: [
                    RowTabOpts(title: "Absente", value: 1),
                    RowTabOpts(title: "Légère à modérée (stade 1-2)", value: 2),
                    RowTabOpts(title: "Sévère (stade 3-4)", value: 3)
                  ],
                  onValueChanged: (int value) {
                    setState(() {
                      _encephalopathie = value;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
