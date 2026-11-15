import 'package:flutter_test/flutter_test.dart';

import 'package:shiny/main.dart';

void main() {
  testWidgets('App boots and shows welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ScrubStudioApp());
    await tester.pumpAndSettle();

    // Welcome screen title
    expect(find.text('Scrub\nSTUDIO'), findsOneWidget);
    // Get Started button
    expect(find.text('GET STARTED'), findsOneWidget);
  });
}
