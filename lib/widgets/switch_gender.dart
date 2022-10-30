import 'package:flutter/material.dart';
import 'package:gaby/const/const.dart';

class SwitchGender extends StatefulWidget {
  const SwitchGender(
      {super.key, required this.gender, required this.onValueChanged});

  final Gender gender;
  final ValueChanged<Gender> onValueChanged;

  @override
  State<SwitchGender> createState() => SwitchGenderState();
}

class SwitchGenderState extends State<SwitchGender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "femme ♀",
          style: TextStyle(
              color: widget.gender == Gender.female
                  ? Colors.pinkAccent
                  : Colors.grey),
        ),
        Switch(
          value: widget.gender != Gender.female,
          activeColor: Colors.red,
          onChanged: (bool value) {
            setState(() {
              if (value) {
                widget.onValueChanged(Gender.male);
              } else {
                widget.onValueChanged(Gender.female);
              }
            });
          },
        ),
        Text(
          "♂ homme",
          style: TextStyle(
              color: widget.gender == Gender.male
                  ? Colors.greenAccent
                  : Colors.grey),
        )
      ],
    );
  }
}
