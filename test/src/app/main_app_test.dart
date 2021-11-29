import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:artisan/artisan.dart';

import '../../mocks.dart';
import '../../utils.dart';
import 'micro_app_test.dart';

class MainAppTest extends MainApp {
  MainAppTest({
    Key? key,
  }) : super(key: key);

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {
        '/base': (context, args) => Container(),
      };

  @override
  List<MicroApp> get microApps => [
        MicroAppTest(),
      ];

  @override
  FutureOr<void> registerAppDependencies() {}

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }

  @override
  ArtisanManager get artisan => ArtisanManagerMock();
}

void main() {
  late MainAppTest mainApp;

  setUp(
    () {
      mainApp = MainAppTest();
    },
  );

  group(
    'BaseApp',
    () {
      test(
        'should register the base routes correctly',
        () {
          expect(mainApp.baseRoutes.containsKey('/base'), true);
          expect(mainApp.routes.containsKey('/base'), true);
        },
      );

      test(
        'should contain the micro app routes when they are registered',
        () {
          expect(mainApp.routes.containsKey('/base-micro'), true);
        },
      );

      test(
        'should contain the micro app routes with wildcard when they are registered',
        () {
          expect(mainApp.routes.containsKey('/base-micro/:id'), true);
        },
      );

      group(
        'generateRoute',
        () {
          test(
            'should find the route on commom case',
            () {
              final route = generateRouteFromUrl(mainApp, url: '/base');

              expect(route, isNotNull);
            },
          );

          test(
            'should find the route with arguments',
            () {
              final route = generateRouteFromUrl(
                mainApp,
                url: '/base',
                arguments: const Arguments(
                  data: 5,
                  params: {
                    'param1': 1,
                    'param2': 1,
                  },
                ),
              );

              expect(route, isNotNull);
              expect(route!.settings.arguments, isNotNull);
            },
          );

          test(
            'should find the route on wildcard case',
            () {
              final route = generateRouteFromUrl(mainApp, url: '/base-micro/1');

              expect(route, isNotNull);
            },
          );

          test(
            'should not find the route on invalid url',
            () {
              final route = generateRouteFromUrl(mainApp, url: '/non-existent');

              expect(route, isNull);
            },
          );
        },
      );
    },
  );
}
