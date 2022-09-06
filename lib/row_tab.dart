import 'package:flutter/material.dart';

class RowTabOpts {
  String title;
  int value;

  RowTabOpts({required this.title, required this.value});
}

class RowTab extends StatefulWidget {
  const RowTab(
      {super.key,
      required this.title,
      required this.onValueChanged,
      required this.options});

  final String title;
  final ValueChanged<int> onValueChanged;
  final List<RowTabOpts> options;

  @override
  State<RowTab> createState() => _RowTabState();
}

class _RowTabState extends State<RowTab> {
  /*List<RowTabOpts> options = [
    RowTabOpts(title: "absent", value: 1),
    RowTabOpts(title: "modérée", value: 2),
    RowTabOpts(title: "tendu", value: 3)
  ];*/

  int _valueToReturn = 0;

  @override
  Widget build(BuildContext context) {
    //return Text("ok");
    return Column(
      children: [
        Text(widget.title),
        Expanded(
          child: ListView.builder(
            itemCount: widget.options.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final opts = widget.options[index];
              return ListTile(
                title: Text(opts.title),
                leading: Radio<int>(
                  value: opts.value,
                  groupValue: _valueToReturn,
                  onChanged: (int? value) {
                    widget.onValueChanged(opts.value);
                    setState(() {
                      _valueToReturn = opts.value;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
