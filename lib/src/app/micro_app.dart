import 'package:artisan/artisan.dart';
import 'package:flutter/material.dart';

import 'app.dart';

abstract class MicroApp extends BaseApp {
  MicroApp({
    Key? key,
  }) : super(key: key);

  String get microAppName;
  String get initialRoute;

  late final ArtisanManager artisan;

  void setArtisan(ArtisanManager artisan) => this.artisan = artisan;
}
