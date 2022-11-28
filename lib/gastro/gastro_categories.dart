import 'package:flutter/material.dart';
import 'package:gaby/blatchford_score.dart';
import 'package:gaby/child_score.dart';
import 'package:gaby/gastro/screen_categories/intestine.dart';
import 'package:gaby/meld_score.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(4),
            color: Color.fromARGB(255, 133, 197, 249),
            child: Row(
              children: [
                Image.asset("assets/intestine.png"),
                SizedBox(width: 5),
                Text("intestine"),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Intestine()));
          },
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(4),
            color: Color.fromARGB(255, 133, 197, 249),
            child: Row(
              children: [
                Image.asset("assets/blood-cells.png"),
                SizedBox(width: 5),
                Text("blood"),
              ],
            ),
          ),
          onTap: () {},
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(4),
            color: Color.fromARGB(255, 133, 197, 249),
            child: Row(
              children: [
                Image.asset("assets/pancreas.png"),
                SizedBox(width: 5),
                Text("pancreas"),
              ],
            ),
          ),
          onTap: () {},
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(4),
            color: Color.fromARGB(255, 133, 197, 249),
            child: Row(
              children: [
                Image.asset("assets/small-intestine.png"),
                SizedBox(width: 5),
                Text("small intestine"),
              ],
            ),
          ),
          onTap: () {},
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(4),
            color: Color.fromARGB(255, 133, 197, 249),
            child: Row(
              children: [
                Image.asset("assets/stomach.png"),
                SizedBox(width: 5),
                Text("stomach"),
              ],
            ),
          ),
          onTap: () {},
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(4),
            color: Color.fromARGB(255, 133, 197, 249),
            child: Row(
              children: [
                Image.asset("assets/liver.png"),
                SizedBox(width: 5),
                Text("liver"),
              ],
            ),
          ),
          onTap: () {},
        )
      ]),
    );
  }
}
