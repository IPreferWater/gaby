import 'package:flutter/material.dart';

class TodoCheckbox {
  String title;
  int valueToReturn;

  TodoCheckbox({required this.title, required this.valueToReturn});
}

class CheckboxReturnValue extends StatefulWidget {
  const CheckboxReturnValue(
      {super.key,
      required this.title,
      required this.valueToReturn,
      required this.onValueChanged});

  final String title;
  final int valueToReturn;
  final ValueChanged<int> onValueChanged;

  @override
  State<CheckboxReturnValue> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxReturnValue> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
        Checkbox(
          key: Key('checkbox-${widget.key}'),
          checkColor: Colors.white,
          value: _checked,
          onChanged: (bool? checked) {
            if (checked != null && checked) {
              widget.onValueChanged(widget.valueToReturn);
            } else {
              widget.onValueChanged(0);
            }

            setState(() {
              _checked = !_checked;
            });
          },
        )
      ],
    );
  }
}
