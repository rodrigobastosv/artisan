import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:artisan/src/app/app.dart';

import '../utils/arguments.dart';

class RoutingData {
  RoutingData(this.uri, this.params);

  final Uri uri;
  final Map<String, dynamic> params;
}

Route<dynamic> generateDefaultRoute(
  WidgetBuilderArgs builder,
  String path,
  Arguments? arguments,
) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: path,
      arguments: arguments,
    ),
    builder: (BuildContext context) => builder.call(
      context,
      arguments,
    ),
  );
}

String prepareToRegex(String url) {
  final newUrl = <String>[];
  for (final part in url.split('/')) {
    final url = part.contains(':') ? '(.*?)' : part;
    newUrl.add(url);
  }

  return newUrl.join('/');
}

RoutingData? parseUrlParams(String routeNamed, Uri uri) {
  if (routeNamed.contains('/:')) {
    final regExp = RegExp('^${prepareToRegex(routeNamed)}\$');

    final routeMatch = regExp.firstMatch(uri.path);
    return routeMatch != null ? _createRoutingData(routeNamed, uri) : null;
  }

  return null;
}

RoutingData _createRoutingData(String routeNamed, Uri uri) {
  final Map<String, String> params = {};
  final routeParts = routeNamed.split('/');
  final pathParts = uri.path.split('/');
  int paramPos = 0;

  String newRouteNamed = routeNamed;

  for (final routePart in routeParts) {
    if (routePart.contains(':')) {
      final paramName = routePart.replaceFirst(':', '');
      if (pathParts[paramPos].isNotEmpty) {
        params[paramName] = pathParts[paramPos];
        newRouteNamed = routeNamed.replaceFirst(routePart, params[paramName]!);
      }
    }
    paramPos++;
  }

  return RoutingData(uri.replace(path: newRouteNamed), params);
}
