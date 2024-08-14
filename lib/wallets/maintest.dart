import 'package:dash/main.dart';
import 'package:dash/wallets/wallethome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp UI Test', (WidgetTester tester) async {
    // Build the MyApp widget.
    await tester.pumpWidget(const MyApp());

    // Verify the presence of the MaterialApp.
    expect(find.byKey(const Key('myApp')), findsOneWidget);

    // Verify the initial screen is WalletHome.
    expect(find.byType(WalletHome), findsOneWidget);
  });
}
