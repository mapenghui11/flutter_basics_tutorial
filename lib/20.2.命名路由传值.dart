import 'package:flutter/material.dart';
import 'pages/tab.dart';
import 'pages/search.dart';
import 'pages/news.dart';
import 'pages/form.dart';
import 'pages/sport.dart';
import 'pages/shop.dart';

/* 命名路由传值步骤：


1. 配置要跳转的页面文件，以shop.dart为例：
    为了获取shop页面的传值，需要给ShopPage定义arguments

    final Map arguments;
    const ShopPage({super.key, required this.arguments});

2. 在跳转的页面文件获取传入的参数：
      @override
      void initState() {
        super.initState();
        print(widget.arguments);
      }

3. 配置要跳转过去的页面，以message.dart为例：
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shop',
                    // 传入参数arguments
                    arguments: {'title': '命名路由传值2', 'aid': 21});
              },
              child: const Text('商店(命名路由传值)'))

4. 将页面文件shop.dart引入主文件main.dart，
    import 'pages/shop.dart';   

5. 在main.dart配置路由：
    final Map routes = {
      '/': (context) => const Tabs(),
      '/news': (context) => const NewsPage(),
      '/sport': (context, {arguments}) => SportPage(arguments: arguments),
      '/shop': (context, {arguments}) => ShopPage(arguments: arguments),
    };

6. 在main.dart加载路由
    initialRoute: '/'

7. 配置onGenerateRoute  固定写法
      onGenerateRoute: (RouteSettings settings) {
        final String? name = settings.name;
        final Function? pageContentBuilder = routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        return null;
      },

*/


void main() {
  runApp(MyApp());
}

// 命名路由传值 具体实现配合message.dart导航选项的sport.dart和shop.dart页面文件查看
class MyApp extends StatelessWidget {
  // 配置Map类型的路由
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

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterdemo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      // 配置onGenerateRoute  固定写法
      onGenerateRoute: (RouteSettings settings) {
        final String? name = settings.name;
        final Function? pageContentBuilder = routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        return null;
      },
    );
  }
}
