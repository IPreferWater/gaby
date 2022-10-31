import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaby/blatchford_score.dart';
import 'package:gaby/international/t.dart';

import 'package:gaby/meld_score.dart';

void main() {
  testWidgets('blatchford', (WidgetTester tester) async {
    final radios = find.byWidgetPredicate(
      (widget) => widget is Radio<int>,
    );


    var ureaWidget = find.byKey(Key("urea-0"));
    var haemoglobin = find.byKey(Key("haemoglobin-0"));
    var systolicBloodPressure = find.byKey(Key("systolicBloodPressure-0"));

    await tester.pumpWidget(MaterialApp(home: BlatchfordScore()));

    //var inr = find.byKey(Key("inr"));
    //var creatinine = find.byKey(Key("créatinine (mg/dl)"));

    

    await tester.tap(ureaWidget);
    await tester.tap(haemoglobin);
    await tester.tap(systolicBloodPressure);
    await tester.pump();

    expect(find.text("Blatchford score : 0"), findsOneWidget);
    
    //await tester.enterText(biliburine, "0.2");
    //await tester.enterText(inr, "2");
    //await tester.enterText(creatinine, "0.8");

    
  });
}
