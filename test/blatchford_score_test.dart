import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaby/blatchford_score.dart';

import 'package:gaby/meld_score.dart';

void main() {
  testWidgets('blatchford', (WidgetTester tester) async {
    final radios = find.byWidgetPredicate(
      (widget) => widget is Radio<int>,
    );

    
    
    //var inr = find.byKey(Key("inr"));
    //var creatinine = find.byKey(Key("créatinine (mg/dl)"));

    await tester.pumpWidget(MaterialApp(home: BlatchfordScore()));
    //await tester.enterText(biliburine, "0.2");
    //await tester.enterText(inr, "2");
    //await tester.enterText(creatinine, "0.8");

    await tester.pump();
  });
}
