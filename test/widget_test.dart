import 'package:flutter_test/flutter_test.dart';

import 'package:mohamed_saad_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Mohamed Saad'), findsOneWidget);
    expect(find.text('Work Experience'), findsOneWidget);
    expect(find.text('Projects'), findsWidgets);
    expect(find.text('Skills'), findsOneWidget);
    expect(find.text('Education'), findsOneWidget);
    expect(find.text('Contact'), findsWidgets);
  });
}
