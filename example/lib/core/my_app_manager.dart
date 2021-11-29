import 'package:artisan/artisan.dart';

import 'my_app_injector.dart';
import 'my_app_logger.dart';

class MyAppManager extends ArtisanManager {
  @override
  Injector get injector => MyAppInjector();

  @override
  Logger get logger => MyAppLogger();
}