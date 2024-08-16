import 'package:dash/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomBottomAppBar UI Test', (WidgetTester tester) async {
    // Build the CustomBottomAppBar widget.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          bottomNavigationBar: CustomBottomAppBar(),
        ),
      ),
    );

    // Verify the presence of the CustomBottomAppBar.
    expect(find.byKey(const Key('customBottomAppBar')), findsOneWidget);

    // Verify the presence of the home button.
    expect(find.byKey(const Key('homeButton')), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);

    // Verify the presence of the settings button.
    expect(find.byKey(const Key('settingsButton')), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}
