import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'protocols.dart';

abstract class ArtisanManager {
  Injector get injector;
  Logger get logger;

  void put<T extends Object>(T t) {
    injector.put<T>(t);
  }

  T get<T extends Object>() {
    return injector.get<T>();
  }

  void log(String value) {
    logger.log(value);
  }

  static ArtisanManager of(BuildContext context) =>
      Provider.of<ArtisanManager>(context);
}

extension ArtisanManagerExt on BuildContext {
  ArtisanManager get artisan => ArtisanManager.of(this);
}
