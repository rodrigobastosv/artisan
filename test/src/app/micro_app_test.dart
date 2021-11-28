import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:artisan/artisan.dart';

import '../../utils.dart';

class MicroAppTest extends MicroApp {
  MicroAppTest({
    Key? key,
  }) : super(key: key);

  @override
  String get microAppName => 'test-micro-app';

  @override
  String get initialRoute => '/base-micro';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/base-micro': (context, args) => Container(),
        '/base-micro/:id': (context, args) => Container(),
      };

  @override
  FutureOr<void> registerDependencies() {}

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}

void main() {
  late MicroAppTest microApp;

  setUp(
    () {
      microApp = MicroAppTest();
    },
  );

  group(
    'MicroApp',
    () {
      test(
        'should register micro app base routes correctly',
        () {
          expect(microApp.routes.containsKey('/base-micro'), true);
          expect(microApp.routes.containsKey('/base-micro/:id'), true);
        },
      );

      group(
        'generateRoute',
        () {
          test(
            'should find the route on commom case',
            () {
              final route = generateRouteFromUrl(microApp, url: '/base-micro');

              expect(route, isNotNull);
            },
          );

          test(
            'should find the route on wildcard case',
            () {
              final route =
                  generateRouteFromUrl(microApp, url: '/base-micro/1');

              expect(route, isNotNull);
            },
          );

          test(
            'should not find the route on invalid url',
            () {
              final route =
                  generateRouteFromUrl(microApp, url: '/non-existent');

              expect(route, isNull);
            },
          );
        },
      );
    },
  );
}
