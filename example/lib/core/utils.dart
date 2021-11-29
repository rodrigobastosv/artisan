import 'package:example/core/my_app_injector.dart';
import 'package:get_it/get_it.dart';

late final MyAppInjector appInjector;

void initCore() {
  appInjector = MyAppInjector(GetIt.I);
}
