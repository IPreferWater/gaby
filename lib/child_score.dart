import 'package:flutter/material.dart';
import 'package:gaby/row_tab.dart';

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
  int _ascite = 0;
  int _bilirubine = 0;
  int _albumine = 0;
  int _inr_tp = 0;
  int _encephalopathie = 0;

  int calculateScore() {
    return _ascite + _bilirubine + _albumine + _inr_tp + _encephalopathie;
  }

  bool isAllValuesSet() {
    print(
        "$_ascite + $_bilirubine + $_albumine + $_inr_tp + $_encephalopathie");
    return _ascite != 0 &&
        _bilirubine != 0 &&
        _albumine != 0 &&
        _inr_tp != 0 &&
        _encephalopathie != 0;
  }

  @override
  Widget build(BuildContext context) {
    List<TodoName> todoNames = [
      TodoName(
        title: "Ascite",
        rowTabOpts: [
          RowTabOpts(title: "absent", value: 1),
          RowTabOpts(title: "modérée", value: 2),
          RowTabOpts(title: "tendu", value: 3),
        ],
        onValueChanged: (int value) {
          setState(() {
            _ascite = value;
          });
        },
      ),
      TodoName(
        title: "Bilirubine (µmol/l)",
        rowTabOpts: [
          RowTabOpts(title: "<35", value: 1),
          RowTabOpts(title: "35-50", value: 2),
          RowTabOpts(title: ">50", value: 3)
        ],
        onValueChanged: (int value) {
          setState(() {
            _bilirubine = value;
          });
        },
      ),
      TodoName(
        title: "Albumine (g/l)",
        rowTabOpts: [
          RowTabOpts(title: ">35", value: 1),
          RowTabOpts(title: "28-35", value: 2),
          RowTabOpts(title: "<28", value: 3)
        ],
        onValueChanged: (int value) {
          setState(() {
            _albumine = value;
          });
        },
      ),
      TodoName(
        title: "INR (TP)",
        rowTabOpts: [
          RowTabOpts(title: "<1.7 (>50%)", value: 1),
          RowTabOpts(title: "1.7-2.2 (40-50%)", value: 2),
          RowTabOpts(title: ">2.2 (<40%)", value: 3)
        ],
        onValueChanged: (int value) {
          setState(() {
            _inr_tp = value;
          });
        },
      ),
      TodoName(
        title: "Encéphalopathie",
        rowTabOpts: [
          RowTabOpts(title: "Absente", value: 1),
          RowTabOpts(title: "Légère à modérée (stade 1-2)", value: 2),
          RowTabOpts(title: "Sévère (stade 3-4)", value: 3)
        ],
        onValueChanged: (int value) {
          setState(() {
            _encephalopathie = value;
          });
        },
      )
    ];

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
              : Text('Child score : remplissez tous les champs',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 30)),
          Expanded(
            child: ListView.builder(
                itemCount: todoNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return RowTab(
                      title: todoNames[index].title,
                      options: todoNames[index].rowTabOpts,
                      onValueChanged: todoNames[index].onValueChanged);
                }),
          )
        ],
      ),
    );
  }
}
