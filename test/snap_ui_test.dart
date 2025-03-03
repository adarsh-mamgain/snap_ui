import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:snap_ui/snap_ui.dart';

void main() {
  testWidgets('SnapCard has correct properties', (WidgetTester tester) async {
    // Create a SnapCard widget with an explicit theme
    final theme = SnapUiTheme.lightTheme;
    final snapCard = SnapCard(
      child: Text('Test Card'),
      theme: theme,
    );

    // Build the widget
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: snapCard)));

    // Verify the SnapCard properties
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final containerWidget = tester.widget<Container>(containerFinder);
    expect(containerWidget.padding, theme.padding);
    expect(
      containerWidget.decoration,
      BoxDecoration(
        color: theme.backgroundColor,
        border: theme.border,
        borderRadius: theme.borderRadius,
        boxShadow: theme.boxShadow,
      ),
    );

    // Verify the child widget
    expect(find.text('Test Card'), findsOneWidget);
  });

  testWidgets('SnapButton has correct properties', (WidgetTester tester) async {
    // Create a SnapButton widget with an explicit theme
    final theme = SnapUiTheme.lightTheme;
    final snapButton = SnapButton(
      child: Text('Test Button'),
      theme: theme,
    );

    // Build the widget
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: snapButton)));

    // Verify the SnapButton properties
    final gestureDetectorFinder = find.byType(GestureDetector);
    expect(gestureDetectorFinder, findsOneWidget);

    final containerFinder = find.descendant(
      of: gestureDetectorFinder,
      matching: find.byType(Container),
    );
    expect(containerFinder, findsOneWidget);

    final containerWidget = tester.widget<Container>(containerFinder);
    expect(containerWidget.padding, theme.padding);
    expect(
      containerWidget.decoration,
      BoxDecoration(
        color: theme.primaryColor,
        border: theme.border,
        borderRadius: theme.borderRadius,
        boxShadow: theme.boxShadow,
      ),
    );

    // Verify the child widget
    expect(find.text('Test Button'), findsOneWidget);
  });
}
