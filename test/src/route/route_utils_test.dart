import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:artisan/src/artisan.dart';

void main() {
  testWidgets(
    'should navigate using generateDefaultRoute',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        generateDefaultRoute(
                          (context, args) => Container(
                            key: const ValueKey('/path'),
                          ),
                          '/path',
                          const Arguments(),
                        ),
                      );
                    },
                    child: const Text(
                      'Navigate',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
      final button = find.text('Navigate');
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('/path')), findsOneWidget);
    },
  );
}
