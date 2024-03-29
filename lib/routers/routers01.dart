import 'package:flutter/material.dart';
import '../pages/tab.dart';
import '../pages/dialog.dart';

// 1. 配置路由
final Map<String, WidgetBuilder> routes = {
  '/': (context) => const Tabs(),
  '/dialog': (context) => const DialogPage(),
};

// 2. 配置onGenerateRoute
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
