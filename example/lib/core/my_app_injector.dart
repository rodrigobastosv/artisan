import 'package:artisan/artisan.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.I;

class MyAppInjector implements Injector {
  @override
  T get<T extends Object>() {
    return injector.get<T>();
  }

  @override
  void put<T extends Object>(T t) {
    injector.registerSingleton<T>(t);
  }
}
