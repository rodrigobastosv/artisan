import 'dart:async';

import 'package:flutter/material.dart';
import 'package:artisan/src/route/route.dart';
import 'package:artisan/src/utils/utils.dart';

typedef WidgetBuilderArgs = Widget Function(
  BuildContext context,
  Arguments? args,
);

abstract class BaseApp extends StatelessWidget {
  BaseApp({
    Key? key,
  }) : super(key: key);

  final Map<String, WidgetBuilderArgs> routes = {};

  FutureOr<void> registerDependencies();

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final Uri currentUri = Uri.parse(settings.name!);
    final String uriPath = currentUri.path;
    final route = routes[uriPath];

    final Arguments routerArgs = settings.arguments != null
        ? (settings.arguments! as Arguments)
        : Arguments(uri: currentUri, params: currentUri.queryParameters);

    if (route != null) {
      final path = routerArgs.uri?.toString() ?? uriPath;
      return generateDefaultRoute(route, path, routerArgs);
    }

    return _generateDynamicRoute(currentUri, routerArgs);
  }

  Route<dynamic>? _generateDynamicRoute(Uri calledUri, Arguments args) {
    Route<dynamic>? dynamicRoute;

    routes.forEach((namedRoute, builder) {
      final routingData = parseUrlParams(namedRoute, calledUri);
      if (routingData != null) {
        final Map<String, dynamic> combinedArgs = {};
        combinedArgs.addAll(routingData.params);
        combinedArgs.addAll(args.params);

        dynamicRoute = generateDefaultRoute(
          builder,
          Uri(path: calledUri.path, queryParameters: args.params).toString(),
          args.copyWith(params: combinedArgs, uri: routingData.uri),
        );
        return;
      }
    });

    return dynamicRoute;
  }
}
