import 'package:flutter/material.dart';

import 'child_score.dart';
import 'gastro/screen_categories/intestine.dart';
import 'gastro_categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Row(
              children: [
                Image.asset("assets/intestine.png"),
                SizedBox(width: 5),
                Text("gastro"),
              ],
            )),
            body: CategoriesScreen()));
  }
}