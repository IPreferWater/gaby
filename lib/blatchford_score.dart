import 'package:flutter/material.dart';
import 'package:gaby/widgets/checkbox_return_value.dart';
import 'package:gaby/const/international.dart';
import 'package:gaby/widgets/row_tab.dart';
import 'package:gaby/widgets/score.dart';
import 'package:gaby/const/const.dart';
import 'package:gaby/widgets/switch_gender.dart';

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
      appBar: AppBar(title: const Text("Blatchford score")),
      body: Column(
        children: [
          Score(
              title: "Blatchford score",
              score: calculateScore(),
              allValueSet: isAllValuesSet()),
          SwitchGender(
              gender: _gender,
              onValueChanged: (Gender value) {
                setState(() {
                  _gender = value;
                });
              }),
          Expanded(
            child: ListView(
              children: [
                RowTab(
                    title: "(mmol/L)",
                    dico: UREA,
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
                        ? "(g/L) ♀ Femme"
                        : "(g/L) ♂ Homme",
                    dico: HAEMOGLOBIN,
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
                    title: "(mmHg)",
                    dico: SYSTOLIC_BLOOD_PRESSURE,
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
                    key: Key(PULSE.id),
                    title: "Fréquence cardiaque > 100 b/min",
                    valueToReturn: 1,
                    onValueChanged: (int value) {
                      setState(() {
                        _pulseGreatherOrEqual100 = value;
                      });
                    }),
                CheckboxReturnValue(
                    key: Key(MELENA.id),
                    title: "Melena",
                    valueToReturn: 1,
                    onValueChanged: (int value) {
                      setState(() {
                        _melaena = value;
                      });
                    }),
                CheckboxReturnValue(
                    key: Key(SYNCOPE.id),
                    title: "Syncope",
                    valueToReturn: 2,
                    onValueChanged: (int value) {
                      setState(() {
                        _syncope = value;
                      });
                    }),
                CheckboxReturnValue(
                    key: Key(HEPATIC_DISEASE.id),
                    title: "Insuffisance hépatique",
                    valueToReturn: 2,
                    onValueChanged: (int value) {
                      setState(() {
                        _hepaticDisease = value;
                      });
                    }),
                CheckboxReturnValue(
                    key: Key(CARDIAC_FAILURE.id),
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
