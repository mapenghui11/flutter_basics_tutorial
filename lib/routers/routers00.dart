import 'package:flutter/material.dart';
import '../pages/tab.dart';
import '../pages/search.dart';
import '../pages/news.dart';
import '../pages/form.dart';
import '../pages/sport.dart';
import '../pages/shop.dart';

// 1. 配置路由
final Map routes = {
  '/': (context) => const Tabs(),
  '/news': (context) => const NewsPage(),
  '/search': (context) => const SearchPage(),
  'form': (context) {
    return const FormPage();
  },
  '/sport': (context, {arguments}) => SportPage(arguments: arguments),
  '/shop': (context, {arguments}) => ShopPage(arguments: arguments),
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

// Android 和ios使用同样风格的路由跳转
// // 1. 引入cupertino.dart
// import 'package:flutter/cupertino.dart';
// import '../pages/tab.dart';
// import '../pages/search.dart';
// import '../pages/news.dart';
// import '../pages/form.dart';
// import '../pages/sport.dart';
// import '../pages/shop.dart';

// // 1. 配置路由
// final Map routes = {
//   '/': (context) => const Tabs(),
//   '/news': (context) => const NewsPage(),
//   '/search': (context) => const SearchPage(),
//   'form': (context) {
//     return const FormPage();
//   },
//   '/sport': (context, {arguments}) => SportPage(arguments: arguments),
//   '/shop': (context, {arguments}) => ShopPage(arguments: arguments),
// };

// // 2. 配置onGenerateRoute
// var onGenerateRoute = (RouteSettings settings) {
//   final String? name = settings.name;
//   final Function? pageContentBuilder = routes[name];
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       // 2. MaterialPageRoute替换为CupertinoPageRoute
//       final Route route = CupertinoPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route =
//           CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   }
//   return null;
// };