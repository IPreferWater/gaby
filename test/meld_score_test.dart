import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gaby/meld_score.dart';

void main() {

  testWidgets('bla', (WidgetTester tester) async {
    var biliburine = find.byKey(Key("biliburine (mg/dl)"));
    var inr = find.byKey(Key("inr"));
    var creatinine = find.byKey(Key("créatinine (mg/dl)"));
    
    await tester.pumpWidget(MaterialApp(home: MeldScore()));
    await tester.enterText(biliburine, "0.2");
    await tester.enterText(inr, "2");
    await tester.enterText(creatinine, "0.8");

    await tester.pump();

    expect(find.text("Meld score : 14.193"), findsOneWidget);

    await tester.enterText(biliburine, "20");
    await tester.enterText(inr, "3");
    await tester.enterText(creatinine, "1.2");

    await tester.pump();
    expect(find.text("Meld score : 31.803"), findsOneWidget);

    await tester.enterText(biliburine, "0.7");
    await tester.enterText(inr, "1");
    await tester.enterText(creatinine, "0.5");

    await tester.pump();
    expect(find.text("Meld score : 6.430"), findsOneWidget);
  });
}
