import 'package:flutter/material.dart';

import 'app.dart';

abstract class MicroApp extends BaseApp {
  MicroApp({
    Key? key,
  }) : super(key: key);

  String get microAppName;
  String get initialRoute;
}
