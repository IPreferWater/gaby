import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaby/blatchford_score.dart';
import 'package:gaby/international/t.dart';

import 'package:gaby/meld_score.dart';
import 'package:gaby/const/const.dart';

void main() {
  testWidgets('blatchfordZero', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(10000, 10000);

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

//TODO find how to activate all checkbox
  /*testWidgets('blatchfordMaximumWomen', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(10000, 10000);

    var ureaWidget = find.byKey(Key("urea-4"));
    var haemoglobin = find.byKey(Key("haemoglobin-2"));
    var systolicBloodPressure =
        find.byKey(Key("systolicBloodPressure-3"), skipOffstage: false);
    var pulseGreatherOrEqual100 = find.byKey(Key('checkbox-${pulse.id}'));
    var checkBoxmelena = find.byKey(Key('checkbox-${melena.id}'));
    var checkBoxsyncope = find.byKey(Key('checkbox-${syncope.id}'));
    var checkBoxhepaticDisease = find.byKey(Key('checkbox-${hepaticDisease.id}'));
    var checkBoxcardiacFailure = find.byKey(Key('checkbox-${cardiacFailure.id}'));
    var score = find.byKey(Key("score"));
    await tester.pumpWidget(MaterialApp(home: BlatchfordScore()));

    await tester.tap(ureaWidget);
    await tester.tap(haemoglobin);
    await tester.tap(systolicBloodPressure);
    await tester.tap(pulseGreatherOrEqual100);
    await tester.tap(checkBoxmelena);
    await tester.tap(checkBoxsyncope);
    await tester.tap(checkBoxhepaticDisease);
    await tester.tap(checkBoxcardiacFailure);

    await tester.pump();

    expect(find.text("Blatchford score : 23"), findsOneWidget);
  });*/
}
