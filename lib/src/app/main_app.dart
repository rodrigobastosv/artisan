import 'dart:async';

import 'package:flutter/material.dart';

import '../artisan.dart';
import 'app.dart';

abstract class MainApp extends BaseApp {
  MainApp({
    Key? key,
  }) : super(key: key) {
    registerRoutes();
    registerDependencies();
  }

  ArtisanManager get artisan;

  List<MicroApp> get microApps;
  Map<String, WidgetBuilderArgs> get baseRoutes;

  FutureOr<void> registerAppDependencies();

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (final microapp in microApps) {
        microapp.setArtisan(artisan);
        routes.addAll(microapp.routes);
      }
    }
  }

  @override
  void registerDependencies() {
    registerAppDependencies();
    if (microApps.isNotEmpty) {
      for (final microapp in microApps) {
        microapp.setArtisan(artisan);
        microapp.registerDependencies();
      }
    }
  }
}
