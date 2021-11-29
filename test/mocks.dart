import 'package:artisan/artisan.dart';

class ArtisanManagerMock extends ArtisanManager {
  @override
  Injector get injector => throw UnimplementedError();

  @override
  Logger get logger => throw UnimplementedError();
}