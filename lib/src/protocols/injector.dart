abstract class Injector {
  void put<T extends Object>(T t);

  T get<T extends Object>();
}
