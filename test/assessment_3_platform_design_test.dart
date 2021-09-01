// // Copyright 2020 The Flutter team. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:platform_design/main.dart';
// import 'package:platform_design/widgets.dart';
//
// void main() {
//   testWidgets('Can change platform correctly', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     // The test should be able to find the drawer button.
//     expect(find.byIcon(Icons.menu), findsOneWidget);
//     // There should be a refresh button.
//     expect(find.byIcon(Icons.refresh), findsOneWidget);
//
//     debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
//     await tester.pumpWidget(MyAdaptingApp());
//
//     // There should now be a large title style nav bar.
//     expect(find.byType(CupertinoSliverNavigationBar), findsOneWidget);
//     // There's a tab button for the first tab.
//     expect(find.byIcon(CupertinoIcons.music_note), findsOneWidget);
//     // The hamburger button isn't there anymore.
//     expect(find.byIcon(Icons.menu), findsNothing);
//
//     // Since this is a static, undo the change made in the test.
//     debugDefaultTargetPlatformOverride = null;
//   });
//
//   testWidgets('Check if is Song list', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     expect(find.text("Songs"), findsOneWidget);
//
//     expect(find.byType(SafeArea), findsNWidgets(3));
//
//     // Since this is a static, undo the change made in the test.
//     debugDefaultTargetPlatformOverride = null;
//   });
//
//   testWidgets('Open drawer and check list', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     expect(find.text("Songs"), findsOneWidget);
//
//     await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
//     await tester.pumpAndSettle();
//
//     expect(find.text("News"), findsOneWidget);
//     expect(find.byIcon(Icons.library_books), findsOneWidget);
//
//     expect(find.text("Profile"), findsOneWidget);
//     expect(find.byIcon(Icons.person), findsOneWidget);
//
//     debugDefaultTargetPlatformOverride = null;
//   });
//
//   testWidgets('Open drawer & tap Profile', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text("Profile"));
//
//     await tester.pumpAndSettle();
//
//     expect(find.text("CURRENT MOOD"), findsOneWidget);
//     expect(find.text("Log out".toUpperCase()), findsOneWidget);
//
//     await tester.tap(find.byIcon(Icons.arrow_back));
//     await tester.pumpAndSettle();
//
//     expect(find.text("Songs"), findsOneWidget);
//
//     debugDefaultTargetPlatformOverride = null;
//   });
//
//   testWidgets('Open drawer & tap Settings', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text("Settings"));
//
//     await tester.pumpAndSettle();
//
//     expect(find.byType(Switch), findsNWidgets(7));
//
//     expect(find.text("Send me marketing emails"), findsOneWidget);
//     expect(find.text("Enable notifications"), findsOneWidget);
//     expect(find.text("Remind me to rate this app"), findsOneWidget);
//     expect(find.text("Background song refresh"), findsOneWidget);
//
//     await tester.tap(find.byIcon(Icons.arrow_back));
//     await tester.pumpAndSettle();
//
//     expect(find.text("Songs"), findsOneWidget);
//
//     debugDefaultTargetPlatformOverride = null;
//   });
//
//   testWidgets('Open drawer & tap News', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     await tester.dragFrom(tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
//     await tester.pumpAndSettle();
//
//     await tester.tap(find.text("News"));
//     await tester.pumpAndSettle();
//
//     expect(find.byType(Card), findsNWidgets(5));
//
//     await tester.tap(find.byIcon(Icons.arrow_back));
//     await tester.pumpAndSettle();
//
//     expect(find.text("Songs"), findsOneWidget);
//
//     debugDefaultTargetPlatformOverride = null;
//   });
//
//   testWidgets('Tap song & go to details', (tester) async {
//     await tester.pumpWidget(MyAdaptingApp());
//
//     await tester.tapAt(const Offset(100.0, 100.0));
//     await tester.pumpAndSettle();
//
//     expect(find.byType(Hero), findsOneWidget);
//     expect(find.text("You might also like:"), findsOneWidget);
//     expect(find.byType(SongPlaceholderTile), findsNWidgets(3));
//
//     await tester.tap(find.byIcon(Icons.arrow_back));
//     await tester.pumpAndSettle();
//
//     expect(find.text("Songs"), findsOneWidget);
//
//     debugDefaultTargetPlatformOverride = null;
//   });
// }
