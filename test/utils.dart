import 'package:flutter/material.dart';
import 'package:artisan/artisan.dart';

Route<dynamic>? generateRouteFromUrl(
  BaseApp testApp, {
  required String url,
  Arguments? arguments,
}) =>
    testApp.generateRoute(
      RouteSettings(name: url, arguments: arguments),
    );
