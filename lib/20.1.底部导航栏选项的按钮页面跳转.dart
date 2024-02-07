import 'package:flutter/material.dart';
import 'pages/tab.dart';
import 'pages/search.dart';
import 'pages/news.dart';
import 'pages/form.dart';

void main() {
  runApp(const MyApp());
}

// ====实现底部导航栏分类选项的按钮页面跳转，具体实现查看‘./tabs/category’和其他要跳转到的页面form，news，search
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutterdemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        // 加载命名路由
        initialRoute: '/', 
        // 命名路由跳转
        routes: {
          // 使用箭头函数配置命名路由
          '/': (context) => const Tabs(),
          '/news': (context) => const NewsPage(),
          '/search': (context) => const SearchPage(),
          // 可以用箭头函数也可以用返回值的方法
          'form': (context) {
            return const FormPage();
          },
        });
  }
}
