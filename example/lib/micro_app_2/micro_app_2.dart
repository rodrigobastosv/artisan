import 'dart:async';

import 'package:artisan/artisan.dart';
import 'package:example/core/utils.dart';
import 'package:flutter/material.dart';

class MicroApp2 extends MicroApp {
  MicroApp2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
    );
  }

  @override
  String get initialRoute => '/micro2';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        initialRoute: (_, args) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Micro App 2'),
                    Text(appInjector.get<String>()),
                  ],
                ),
              ),
            ),
      };

  @override
  String get microAppName => 'Micro 2';

  @override
  FutureOr<void> registerDependencies() {}
}
