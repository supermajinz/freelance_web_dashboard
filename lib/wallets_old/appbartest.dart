import 'package:dash/wallets_old/appbartitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppBarTitle UI Test', (WidgetTester tester) async {
    // Build the AppBarTitle widget.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const AppBarTitle(),
          ),
        ),
      ),
    );

    // Verify the presence of the AppBarTitle.
    expect(find.byKey(const Key('appBarTitle')), findsOneWidget);

    // Verify the text spans are correct.
    expect(find.text("My Cards", findRichText: true), findsOneWidget);
  });
}
