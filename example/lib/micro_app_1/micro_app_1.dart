import 'dart:async';

import 'package:artisan/artisan.dart';
import 'package:example/core/utils.dart';
import 'package:flutter/material.dart';

class MicroApp1 extends MicroApp {
  MicroApp1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
    );
  }

  @override
  String get initialRoute => '/micro1';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        initialRoute: (context, args) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Micro App 1'),
                    Text(appInjector.get<int>().toString()),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/micro2');
                      },
                      child: const Text('MicroApp 2'),
                    ),
                  ],
                ),
              ),
            ),
      };

  @override
  String get microAppName => 'Micro 1';

  @override
  FutureOr<void> registerDependencies() {}
}
