import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class TodoName {
  String title;
  final ValueChanged<String> onValueChanged;

  TodoName({required this.title, required this.onValueChanged});
}

class MeldScore extends StatefulWidget {
  const MeldScore({super.key});

  @override
  State<MeldScore> createState() => _MeldScoreState();
}

class _MeldScoreState extends State<MeldScore> {
  //Formule: MELD = 3,78 x ln( bilirubine [mg/dl] ) + 11,2 x ln( INR ) + 9,57 x ln( créatinine [mg/dl] ) + 6,43.
  double _bilirubine = -1;
  double _inr = -1;
  double _creatinine = -1;

//TODO if val < 1, then =1
  String calculateScore() {
    double score = ((3.78 * log(_bilirubine) + (11.2 * log(_inr))) +
        (9.57 * log(_creatinine)) +
        6.43);
    return score.toStringAsFixed(3);
  }

  bool isAllValuesSet() {
    return _bilirubine != -1 && _inr != -1 && _creatinine != -1;
  }

  @override
  Widget build(BuildContext context) {
    List<TodoName> todoNames = [
      TodoName(
          title: "biliburine (mg/dl)",
          onValueChanged: (String value) {
            double? d = double.tryParse(value);
            if (d == null) {
              print('cant parse double $value');
            } else {

              if (d < 1) {
                d = 1;
              }
              setState(() {
                _bilirubine = d!;
              });
            }
          }),
      TodoName(
          title: "inr",
          onValueChanged: (String value) {
            setState(() {
              double? d = double.tryParse(value);
              if (d == null) {
                print('cant parse double $value');
              } else {
                if (d < 1) {
                d = 1;
              }
                setState(() {
                  _inr = d!;
                });
              }
            });
          }),
      TodoName(
          title: "créatinine (mg/dl)",
          onValueChanged: (String value) {
            setState(() {
              double? d = double.tryParse(value);
              if (d == null) {
                print('cant parse double $value');
              } else {

                if (d < 1) {
                d = 1;
              }
                setState(() {
                  _creatinine = d!;
                });
              }
            });
          })
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Meld score")),
      body: Column(
        children: [
          // if are values are set, show the score
          isAllValuesSet() == true
              ? Text(
              'Meld score : ${calculateScore()}',
              key: const Key("score"),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 50))
              //if some values are missing, display warning message
              : Text('Meld Score : remplissez tous les champs',
              key : const Key("score"),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 30)),

          SizedBox(
            width: 300,
            height: 300,
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: todoNames.length,
                itemBuilder: (BuildContext context, int index) {
                  TodoName t = todoNames[index];
                  return TextField(
                    key: Key(t.title),
                    decoration: InputDecoration(
                        labelText: t.title,
                        hintText: t.title,
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      //TODO regex that accept only one .
                      FilteringTextInputFormatter.allow(RegExp(r'^[\.0-9]*$'))
                    ],
                    onChanged: t.onValueChanged,
                  );
                }),
          ),
          const Text(
              'Formule: MELD = 3,78 x ln( bilirubine [mg/dl] ) + 11,2 x ln( INR ) + 9,57 x ln( créatinine [mg/dl] ) + 6,43'),
        ],
      ),
    );
  }
}
