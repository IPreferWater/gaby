import 'package:flutter/material.dart';
import 'package:gaby/const/const.dart';

import 'international/t.dart';

class RowTabOpts {
  String title;
  int value;

  RowTabOpts({required this.title, required this.value});
}

class RowTab extends StatefulWidget {
  const RowTab(
      {super.key,
      required this.title,
      required this.vvv,
      required this.onValueChanged,
      required this.options});

  final String title;
  final vv vvv;
  final ValueChanged<int> onValueChanged;
  final List<RowTabOpts> options;

  @override
  State<RowTab> createState() => _RowTabState();
}

class _RowTabState extends State<RowTab> {
  int _valueToReturn = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Text('${widget.vvv.map[Languages.fr]!} ${widget.title}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
        for (var opts in widget.options)
          ListTile(
              title: Text(opts.title),
              leading: Radio<int>(
                key: Key('${widget.vvv.id}-${opts.value}'),
                value: opts.value,
                groupValue: _valueToReturn,
                onChanged: (int? value) {
                  widget.onValueChanged(opts.value);
                  setState(() {
                    _valueToReturn = opts.value;
                  });
                },
              ))
      ],
    );
  }
}
