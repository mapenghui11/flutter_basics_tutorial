import 'package:flutter/material.dart';
import '../pages/tab.dart';
import '../pages/dialog.dart';
import '../pages/pageView.dart';
import '../pages/pageViewBuilder.dart';
import '../pages/pageViewFull.dart';
import '../pages/pageViewSwiper.dart';
import '../pages/pageViewSwiperFull.dart';
import '../pages/pageViewSwiperLive.dart';


// 1. 配置路由
final Map<String, WidgetBuilder> routes = {
  '/': (context) => const Tabs(),
  '/dialog': (context) => const DialogPage(),
  '/pageView': (context) => const PageViewPage(),
  '/pageViewBuilder': (context) => const PageViewBuilderPage(),
  '/pageViewFull': (context) => const PageViewFillPage(),
  '/pageViewSwiper': (context) => const PageViewSwiper(),
  '/pageViewSwiperFull': (context) => const PageViewSwiperFull(),
  '/pageViewSwiperLive': (context) => const PageViewSwiperLive(),
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
