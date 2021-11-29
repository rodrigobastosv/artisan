import 'package:example/core/injector.dart';
import 'package:get_it/get_it.dart';

class MyAppInjector implements Injector {
  MyAppInjector(this.injector);

  final GetIt injector;

  @override
  T get<T extends Object>() {
    return injector.get<T>();
  }

  @override
  void put<T extends Object>(T t) {
    injector.registerSingleton<T>(t);
  }
}
