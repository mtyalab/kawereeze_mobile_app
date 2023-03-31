import 'package:flutter_test/flutter_test.dart';

import 'package:kawereeze/main.dart';

void main() {
  testWidgets('Load the whole App test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(title: "Kaweereze",));
  });
}
