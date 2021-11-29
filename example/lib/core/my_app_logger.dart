import 'package:artisan/artisan.dart';

class MyAppLogger implements Logger {
  @override
  void log(String value) {
    print(value);
  }
}
