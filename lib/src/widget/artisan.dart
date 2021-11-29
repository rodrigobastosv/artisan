import 'package:artisan/artisan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Artisan extends StatelessWidget {
  const Artisan(
    this.app, {
    Key? key,
  }) : super(key: key);

  final MainApp app;

  @override
  Widget build(BuildContext context) {
    return Provider<ArtisanManager>.value(
      value: app.artisan,
      child: app,
    );
  }
}
