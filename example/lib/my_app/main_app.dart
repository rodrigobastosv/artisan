import 'dart:async';

import 'package:artisan/artisan.dart';
import 'package:example/core/utils.dart';
import 'package:example/micro_app_1/micro_app_1.dart';
import 'package:example/micro_app_2/micro_app_2.dart';
import 'package:flutter/material.dart';

class MyApp extends MainApp {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      initialRoute: '/micro1',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroApp1(),
        MicroApp2(),
      ];

  @override
  FutureOr<void> registerAppDependencies() {
    appInjector.put<int>(3);
    appInjector.put<String>('aaa');
  }
}
