/* Android 和ios使用同样风格的路由跳转
  Material组件库中的MaterialPageRoute组件使用和平台风格一致的路由切换动画，
  如在ios上会左右滑动切换，而在Android上会上下滑动切换,
  CupertinoPageRoute是Cupertino组件库的ios风格的路由切换组件，
  如果在Android上也想使用左右切换风格，可以使用CupertinoPageRoute。

  1. 在路由配置文件routers.dart中引入cupertino.dart

    import 'package:flutter/cupertino.dart';

  2. MaterialPageRoute替换为CupertinoPageRoute
*/

// 1. 引入cupertino.dart
import 'package:flutter/cupertino.dart';
import '../pages/tab.dart';
import '../pages/search.dart';
import '../pages/news.dart';
import '../pages/form.dart';
import '../pages/sport.dart';
import '../pages/shop.dart';

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

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      // 2. MaterialPageRoute替换为CupertinoPageRoute
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};


/* 全局配置主题
  theme: Themedata(
    primarySwatch: Colors.blue
    // 设置标题居中
    appBarTheme: const AppBarTheme(centerTitle: true))

*/
