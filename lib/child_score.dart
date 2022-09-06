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

  int calculateScore() {
    return _ascite + _bilirubine;
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
      /* TodoName(
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
      )*/
    ];

    print(todoNames);
    return Expanded(
      child: Column(
        children: [
          Text('${calculateScore()}'),
          Expanded(
            child: todoNames.map((e) => 
            RowTab(
              title: title, 
              onValueChanged: onValueChanged, 
              options: options)).toList(growable: false);
            /*child: RowTab(
              title: 'Ascite',
              options: [
                RowTabOpts(title: "absente", value: 1),
                RowTabOpts(title: "modérée", value: 2),
                RowTabOpts(
                    title: "tendu ou réfractaire aux diurétiques", value: 3)
              ],
              onValueChanged: (int value) {
                setState(() {
                  _ascite = value;
                });
              },
            ),
          ),
          Expanded(
            child: RowTab(
              title: 'Bilirubine (µmol/l)',
              options: [
                RowTabOpts(title: "<35", value: 1),
                RowTabOpts(title: "35-50", value: 2),
                RowTabOpts(title: ">50", value: 3)
              ],
              onValueChanged: (int value) {
                setState(() {
                  _bilirubine = value;
                });
              },
            ),*/
          )
        ],
      ),
    );
  }
}
