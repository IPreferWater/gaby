import 'package:flutter/material.dart';
import 'package:gaby/checkbox_return_value.dart';
import 'package:gaby/row_tab.dart';
import 'package:gaby/widgets/score.dart';

enum Gender { female, male }

class TodoName {
  String title;
  List<RowTabOpts> rowTabOpts;
  final ValueChanged<int> onValueChanged;

  TodoName(
      {required this.title,
      required this.rowTabOpts,
      required this.onValueChanged});
}

class BlatchfordScore extends StatefulWidget {
  const BlatchfordScore({super.key});

  @override
  State<BlatchfordScore> createState() => _BlatchfordScoreState();
}

class _BlatchfordScoreState extends State<BlatchfordScore> {
  bool _switch = false;
  Gender _gender = Gender.female;
  int _urea = -1;
  int _haemoglobin = -1;
  int _systolicBloodPressure = -1;
  int _pulseGreatherOrEqual100 = 0;
  int _melaena = 0;
  int _syncope = 0;
  int _hepaticDisease = 0;
  int _cardiacFailure = 0;

  int calculateScore() {
    return _urea +
        _haemoglobin +
        _systolicBloodPressure +
        _pulseGreatherOrEqual100 +
        _melaena +
        _syncope +
        _hepaticDisease +
        _cardiacFailure;
  }

  bool isAllValuesSet() {
    return _urea != -1 && _haemoglobin != -1 && _systolicBloodPressure != -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: Column(
        children: [
          Score(
              title: "Blatchford score",
              score: calculateScore(),
              allValueSet: isAllValuesSet()),
          // if are values are set, show the score
          /*isAllValuesSet() == true
              ? Text('Blatchford score : ${calculateScore()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 50))
              //if some values are missing, display warning message
              : Text('Blatchford score : remplissez tous les champs',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 30)),*/
          Row(
            //TODO switching beetween male/female should reset the widget depending on the gender
            children: [
              Text(
                "femme ♀",
                style: TextStyle(
                    color: _gender == Gender.female
                        ? Colors.pinkAccent
                        : Colors.grey),
              ),
              //TODO widget switch male female
              Switch(
                // This bool value toggles the switch.
                value: _switch,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  setState(() {
                    if (value) {
                      _gender = Gender.male;
                    } else {
                      _gender = Gender.female;
                    }
                    _switch = value;
                  });
                },
              ),
              Text(
                "♂ homme",
                style: TextStyle(
                    color: _gender == Gender.male
                        ? Colors.greenAccent
                        : Colors.grey),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                RowTab(
                    title: "Urée (mmol/L)",
                    options: [
                      RowTabOpts(title: "< 6.5", value: 0),
                      RowTabOpts(title: "6.5–8.0", value: 2),
                      RowTabOpts(title: "8.0–10.0", value: 3),
                      RowTabOpts(title: "10.0–25", value: 4),
                      RowTabOpts(title: "> 25", value: 6),
                    ],
                    onValueChanged: (int value) {
                      setState(() {
                        _urea = value;
                      });
                    }),
                RowTab(
                    title: _gender == Gender.female
                        ? "Hémoglobine (g/L) ♀ Femme"
                        : "Hémoglobine (g/L) ♂ Homme",
                    options: _gender == Gender.female
                        ? [
                            RowTabOpts(title: "> 11.9", value: 0),
                            RowTabOpts(title: "10.0–11.9", value: 1),
                            RowTabOpts(title: "< 10.0", value: 6),
                          ]
                        : [
                            RowTabOpts(title: "> 12.9", value: 0),
                            RowTabOpts(title: "12.0–12.9", value: 1),
                            RowTabOpts(title: "10.0–11.9", value: 3),
                            RowTabOpts(title: "< 10.0", value: 6)
                          ],
                    onValueChanged: (int value) {
                      setState(() {
                        _haemoglobin = value;
                      });
                    }),
                RowTab(
                    title: "Tension artérielle systolique (mmHg)",
                    options: [
                      RowTabOpts(title: "> 109", value: 0),
                      RowTabOpts(title: "100-109", value: 1),
                      RowTabOpts(title: "90-99", value: 2),
                      RowTabOpts(title: "< 90", value: 3)
                    ],
                    onValueChanged: (int value) {
                      setState(() {
                        _systolicBloodPressure = value;
                      });
                    }),
                CheckboxReturnValue(
                    title: "Fréquence cardiaque > 100 b/min",
                    valueToReturn: 1,
                    onValueChanged: (int value) {
                      setState(() {
                        _pulseGreatherOrEqual100 = value;
                      });
                    }),
                CheckboxReturnValue(
                    title: "Melena",
                    valueToReturn: 1,
                    onValueChanged: (int value) {
                      setState(() {
                        _melaena = value;
                      });
                    }),
                CheckboxReturnValue(
                    title: "Syncope",
                    valueToReturn: 2,
                    onValueChanged: (int value) {
                      setState(() {
                        _syncope = value;
                      });
                    }),
                CheckboxReturnValue(
                    title: "Insuffisance hépatique",
                    valueToReturn: 2,
                    onValueChanged: (int value) {
                      setState(() {
                        _hepaticDisease = value;
                      });
                    }),
                CheckboxReturnValue(
                    title: "Insuffisance cardiaque",
                    valueToReturn: 2,
                    onValueChanged: (int value) {
                      setState(() {
                        _cardiacFailure = value;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
