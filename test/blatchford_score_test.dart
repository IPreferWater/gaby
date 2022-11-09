import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaby/blatchford_score.dart';
import 'package:gaby/international/t.dart';

import 'package:gaby/meld_score.dart';

void main() {
  testWidgets('blatchfordZero', (WidgetTester tester) async {

    tester.binding.window.physicalSizeTestValue = Size(10000, 10000);

    final radios = find.byWidgetPredicate(
      (widget) => widget is Radio<int>,
    );


    var ureaWidget = find.byKey(Key("urea-0"));
    var haemoglobin = find.byKey(Key("haemoglobin-0"));
    var systolicBloodPressure = find.byKey(Key("systolicBloodPressure-0"));

    await tester.pumpWidget(MaterialApp(home: BlatchfordScore()));

    await tester.tap(ureaWidget);
    await tester.tap(haemoglobin);
    await tester.tap(systolicBloodPressure);
    await tester.pump();

    expect(find.text("Blatchford score : 0"), findsOneWidget);
  });
}
