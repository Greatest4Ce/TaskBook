import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:to_do_list_new/presentation/screens/homepage.dart' as homepage;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("create new task", () {
    testWidgets('createTask', (tester) async {
      homepage.HomePage;

      await tester.pumpAndSettle();

      final Finder newTaskButton = find.text("new task");

      await tester.tap(newTaskButton);

      await tester.pumpAndSettle();

      expect(find.text('Сохранить'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'bread');

      final Finder saveButton = find.text('Сохранить');

      await tester.tap(saveButton);

      await tester.pumpAndSettle();

      expect(find.text('bread'), findsOneWidget);
    });
  });
}
